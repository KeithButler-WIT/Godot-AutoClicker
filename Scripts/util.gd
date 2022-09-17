extends Node

class_name Util

static func nFormatter(num):
#	var lookup = [
#	{ value: 1, symbol: "" },
#	{ value: 1e3, symbol: "k" },
#	{ value: 1e6, symbol: "M" },
#	{ value: 1e9, symbol: "G" },
#	{ value: 1e12, symbol: "T" },
#	{ value: 1e15, symbol: "P" },
#	{ value: 1e18, symbol: "E" }
#	]
##	var rx = /\.0+$|(\.[0-9]*[1-9])0+$/
##	lookup.slice().reverse()
#	var item = lookup.slice().reverse().find(function(item):
#		return num >= item.value;
#	return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";

	var i_offset = 15 # change this if you extend the symbols!!!
	var prec = 3
	var fmt = '{p}'.format({"p": prec})
	var symbols = ['Y', 'T', 'G', 'M', 'k', '', 'm', 'u', 'n']
	
#	var e = log10(abs(num))
	var e = log(abs(num))
	if e >= i_offset + 3:
		return '{fmt}'.format({"fmt": fmt})
	for i in symbols:
		print(symbols[i])
		var e_thresh = i_offset - 3 * i
		if e >= e_thresh:
			return '{fmt}{sym}'.format({"fmt": fmt, "sym": symbols[i]})
	return '{fmt}'.format({"fmt": fmt})
