File.read("input.txt").split("\n").each { |s| (0...s.length).each { |i| (puts(i + 1); break) if (s[[0, i - 3].max .. i].chars.uniq.length == 4) } }
