GM.Name = "CrabScare"
GM.Author = "MeijiIshinIsLame"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("sandbox")
team.SetUp( 1, "Gnomes", Color(125, 255, 125, 255) )
team.SetUp( 2, "Humans", Color(125, 255, 255, 255) ) 

function GM:initialize()

	self.baseclass.Initialize(self)

end