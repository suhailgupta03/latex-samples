local json = require("json")
local file = io.open("sample.json")
tab = json.parse(file:read("*all"))
file:close()


for i,k in pairs(tab['tableOfContents']) do
		 --print ("\string\\section{" .. k.section.title .. "}")
		 --print("section text here")
		 for ii,kk in pairs(k["subsection"]) do
		 	--print ("\string\\subsection{" .. kk.title .. "}")
		 	--print ("some text here")
			--print("\string\\newline")
			for iii, kkk in pairs(kk["content"]) do
				if kkk['type'] == "text" then
					--print(kkk["line"])
					--print("\string\\newline")
				elseif kkk["type"] == "table" then
					local column_count = 0
					local row_count = 0
					for _ in pairs(kkk["columns"]) do column_count = column_count + 1 end
					for _ in pairs(kkk["columns"][1]["values"]) do row_count = row_count + 1 end
					--print("\string\\begin{tabular}")
                    			print(kkk["columns"])
--					for ci, c in pairs(kkk["columns"]) do
--						print(ci)
--					end						
--					print("\string\\end{tabular}")
				end
			end
		 end
	end

