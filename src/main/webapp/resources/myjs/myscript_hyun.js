/**
 * myscript.js
 */

// 오늘날짜와 비교하여 같은 날이면 getDate, 다른 날이면 getTime 실행
function getDateFormat(millisecond) {
	if (isSameDate(millisecond)) {
		return getTime(millisecond);
	} else {
		return getDate(millisecond);
	}
}

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
	
	let dateFormat = make2digits(hour) + ":" + make2digits(minute);
					 
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
	