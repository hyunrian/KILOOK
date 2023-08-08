/**
 * myscript.js
 */
 
// 날짜 얻기
function getDate(millisecond) {
	if (!millisecond) {
		return "";
	}
	
	let d = new Date(millisecond);
	// 2023-08-07 15:36:22.0
	let year = d.getFullYear();
	let month = d.getMonth() + 1;
	let day = d.getDate();
	
	let dateFormat = year + "-" + make2digits(month) + "-" + make2digits(day);
					 
	return dateFormat;
}

// 시간 얻기
function getTime(millisecond) {
	let d = new Date(millisecond);
	let hour = d.getHours();
	let minute = d.getMinutes();
	let second = d.getSeconds();
	
	let dateFormat = make2digits(hour) + ":" + make2digits(minute) 
					 + ":" + make2digits(second);
					 
	return dateFormat;
}

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}

// 오늘 날짜와 입력된 날짜 비교
function isSameDate(millisecond) {
	let today = getDate(new Date());
	let thatday = getDate(new Date(millisecond));
	console.log("today", today);
	console.log("thatday", thatday);
	if (today == thatday) return true;
	else return false;
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
	