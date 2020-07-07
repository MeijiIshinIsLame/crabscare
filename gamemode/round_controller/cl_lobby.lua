net.Receive("open_lobby", function()

end)

function openLobby()

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW(), ScrH())
	frame:Center()
	frame:SetVisible(true)
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame:SetTitle("")

	frame.Paint = function(s, w, h)

		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))

	end
	frame:MakePopup()

	local startButton = vgui.Create("DButton", frame)
	startButton:SetSize(200, 75)
	startButton:SetPos(ScrW()/2 - 100, ScrH()/2 - (75 / 2))
	startButton:SetText("Enter Game")

	startButton.DoClick = function()

		net.Start("start_game")
		net.SendToServer()

		frame:Close()

	end

end

net.Receive("open_lobby", openLobby)