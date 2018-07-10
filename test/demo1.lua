local ws=require "wsclient"

local Hander={}

function login_login(msg)
	print(msg.error)
	if msg.error=="login success" then
		ws.create_room("ddz")
		--os.execute("sleep "..1)	
		--ws.enter_room()
	else 
		print("account:"..msg.account..",login err:",msg.error)
	end

end

function create_room(msg)
	print("create_room ret:"..msg.result)
	ws.enter_room()
end


function enter_room(msg)
	print("enter_room ret:"..msg.result)
	ws.leave_room()
end

function leave_room(msg)
	print("leave_room ret:"..msg.result)
end

function Hander.CallBack(msg)
	funcname=string.gsub(msg._cmd,"%.","_")		
	if _G[funcname] then 
		_G[funcname](msg)
	end
end

ws.init(nil,nil,Hander)
ws.login("king","111111")
ws.start()


