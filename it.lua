
local json = require("json")
local file = io.open("sample.json")
tab = json.parse(file:read("*all"))
file:close()


function isempty(s)
  return s == nil or s == ''
end

function renderSections(tab)
	for i,k in pairs(tab['tableOfContents']) do
		 --tex.print ("\string\\section{" .. k.section.title .. "}")
		 --tex.print("section text here")
		 for ii,kk in pairs(k["subsection"]) do
		 	--tex.print ("\string\\subsection{" .. kk.title .. "}")
		 	--tex.print ("some text here")
			--tex.print("\string\\newline")
			for iii, kkk in pairs(kk["content"]) do
				if kkk['type'] == "text" then
					--tex.print(kkk["line"])
					--tex.print("\string\\newline")
				elseif kkk["type"] == "table" then
					local column_count = 0
					local row_count = 0
					col_schema = ""
					for _ in pairs(kkk["columns"]) do 
						column_count = column_count + 1 
						col_schema = col_schema .. " | l"
					end
					col_schema = col_schema .. "|"
					print(col_schema)
					for _ in pairs(kkk["columns"][1]["values"]) do row_count = row_count + 1 end
					if not isempty(kkk.title) then
						--tex.print("\string\\textbf{" .. kkk.title .."}")
						--tex.print("\\\\[0.1in]")
					end
					--tex.print("\string\\begin{tabular}{"  .. col_schema ..  "}")
					--tex.print("\\hline")
					for ci, c in pairs(kkk["columns"]) do
						--tex.print(c.name)
						if ci < column_count then
							--tex.print(" & ")
						end
					end	
					--tex.print("\\\\")
					--tex.print("\\hline")
					i = 1
					while i <= row_count do
						local c_c = 1
						while c_c <= column_count do
							--tex.print(kkk["columns"][c_c]["values"][i])
							if c_c < column_count then
								--tex.print(" & ")
							end
							c_c = c_c + 1
						end
						--tex.print("\\\\")
						--tex.print("\\hline")
						i = i + 1
					end
					--tex.print("\string\\end{tabular}")
					--tex.print("\\\\[0.5in]")
				end
			end
		 end
	end
end



renderSections(tab)
