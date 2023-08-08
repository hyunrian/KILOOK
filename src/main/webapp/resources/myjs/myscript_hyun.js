/**
 * myscript.js
 */
 
function toDateString(millisecond) {
	if (!millisecond) {
		return "";
	}
	
	let d = new Date(millisecond);
	// 2023-07-18 14:50:50
	let year = d.getFullYear();
	let month = d.getMonth() + 1;
	let day = d.getDate();
	let hour = d.getHours();
	let minute = d.getMinutes();
	let second = d.getSeconds();
	
	let dateFormat = year + "-" + make2digits(month) + "-" + make2digits(day)
					 + " " + make2digits(hour) + ":" + make2digits(minute) 
					 + ":" + make2digits(second);
					 
	// console.log(dateFormat);
	
	return dateFormat;
}

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}

function isImage(filename) {
	let formatName = getFormatName(filename);
	let uName = formatName.toUpperCase();
	if (uName == "JPG" || uName == "GIF" || uName == "PNG") {
		return true;
	}
	return false;
}

function getFormatName(filename) {
	let dotIndex = filename.lastIndexOf(".");
	let formatName = filename.substring(dotIndex + 1); // 확장자
	return formatName;
}

function getThumbnailName(fullname) {
	let slashIndex = fullname.lastIndexOf("/");
	let front = fullname.substring(0, slashIndex + 1);
	let back = fullname.substring(slashIndex + 1);
	let thumbnail = front + "s_" + back;
	return thumbnail;
}
	