local res = {}

-- 星，月，日
res.grade_star_icon = {
	"ui/common/one_star.png",
	"ui/common/one_moon.png",
	"ui/common/one_sun.png",
}


function QResPath(key)
	return res[key]
end
