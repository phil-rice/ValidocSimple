//---------------------------------------------------------------------
// JavaScript-HTML5 QRCode Generator
//
// Copyright (c) 2011 Amanuel Tewolde
//
// Licensed under the MIT license:
// http://www.opensource.org/licenses/mit-license.php
//
//---------------------------------------------------------------------

// Generates a QRCode of text provided.
// First QRCode is rendered to a canvas.
// The canvas is then turned to an image PNG
// before being returned as an <img> tag.
var _SVG;

var QRCodeVersion = 1; // 1-40 see
						// http://www.denso-wave.com/qrcode/qrgene2-e.html

function increaseQRCodeVersion() {
	QRCodeVersion++;
	// document.getElementById("qrcl").innerHTML = QRCodeVersion;
}
function resetQRVersion() {
	QRCodeVersion = 1;
}
function checkRange(x, n, m) {
	if (x >= n && x <= m) {
		return x;
	} else {
		return !x;
	}
}

function showQRCode(text, qrwidth, qrheight) {
	// text = encodeURI( text );
	qrlen = text.length;
	switch (qrlen) {
	case checkRange(qrlen, 1, 10):
		QRCodeVersion = 1;
		break;
	case checkRange(qrlen, 11, 20):
		QRCodeVersion = 2;
		break;
	case checkRange(qrlen, 21, 35):
		QRCodeVersion = 3;
		break;
	case checkRange(qrlen, 36, 50):
		QRCodeVersion = 4;
		break;
	case checkRange(qrlen, 51, 64):
		QRCodeVersion = 5;
		break;
	case checkRange(qrlen, 65, 84):
		QRCodeVersion = 6;
		break;
	case checkRange(qrlen, 85, 93):
		QRCodeVersion = 7;
		break;
	case checkRange(qrlen, 94, 122):
		QRCodeVersion = 8;
		break;
	case checkRange(qrlen, 123, 143):
		QRCodeVersion = 9;
		break;
	case checkRange(qrlen, 144, 174):
		QRCodeVersion = 10;
		break;
	case checkRange(qrlen, 175, 200):
		QRCodeVersion = 11;
		break;
	case checkRange(qrlen, 201, 227):
		QRCodeVersion = 12;
		break;
	case checkRange(qrlen, 228, 259):
		QRCodeVersion = 13;
		break;
	case checkRange(qrlen, 260, 283):
		QRCodeVersion = 14;
		break;
	case checkRange(qrlen, 284, 321):
		QRCodeVersion = 15;
		break;
	case checkRange(qrlen, 322, 365):
		QRCodeVersion = 16;
		break;
	case checkRange(qrlen, 366, 408):
		QRCodeVersion = 17;
		break;
	case checkRange(qrlen, 409, 452):
		QRCodeVersion = 18;
		break;
	case checkRange(qrlen, 453, 493):
		QRCodeVersion = 19;
		break;
	case checkRange(qrlen, 494, 557):
		QRCodeVersion = 20;
		break;
	case checkRange(qrlen, 558, 587):
		QRCodeVersion = 21;
		break;
	case checkRange(qrlen, 588, 640):
		QRCodeVersion = 22;
		break;
	case checkRange(qrlen, 641, 672):
		QRCodeVersion = 23;
		break;
	case checkRange(qrlen, 673, 744):
		QRCodeVersion = 24;
		break;
	case checkRange(qrlen, 745, 779):
		QRCodeVersion = 25;
		break;
	case checkRange(qrlen, 780, 864):
		QRCodeVersion = 26;
		break;
	case checkRange(qrlen, 865, 910):
		QRCodeVersion = 27;
		break;
	case checkRange(qrlen, 911, 958):
		QRCodeVersion = 28;
		break;
	case checkRange(qrlen, 959, 1016):
		QRCodeVersion = 29;
		break;
	case checkRange(qrlen, 1017, 1080):
		QRCodeVersion = 30;
		break;
	case checkRange(qrlen, 1081, 1150):
		QRCodeVersion = 31;
		break;
	case checkRange(qrlen, 1151, 1226):
		QRCodeVersion = 32;
		break;
	case checkRange(qrlen, 1227, 1307):
		QRCodeVersion = 33;
		break;
	case checkRange(qrlen, 1308, 1394):
		QRCodeVersion = 34;
		break;
	case checkRange(qrlen, 1395, 1431):
		QRCodeVersion = 35;
		break;
	case checkRange(qrlen, 1432, 1530):
		QRCodeVersion = 36;
		break;
	case checkRange(qrlen, 1531, 1591):
		QRCodeVersion = 37;
		break;
	case checkRange(qrlen, 1592, 1658):
		QRCodeVersion = 38;
		break;
	case checkRange(qrlen, 1659, 1774):
		QRCodeVersion = 39;
		break;
	case checkRange(qrlen, 1775, 1852):
		QRCodeVersion = 40;
		break;
	}
	// document.getElementById("qrcl").innerHTML = "qrcode version = " +
	// QRCodeVersion + "; message = " + text;

	var dotsize = 5; // size of box drawn on canvas
	var padding = 10; // (white area around your QRCode)
	var black = "rgb(0,0,0)";
	var white = "rgb(255,255,255)";

	var canvas = document.createElement('canvas');
	var cs = new CanvasSVG.Deferred();
	cs.wrapCanvas(canvas);
	var qrCanvasContext = canvas.getContext('2d');
	try {
		// QR Code Error Correction Capability
		// Higher levels improves error correction capability while decreasing
		// the amount of data QR Code size.
		// QRErrorCorrectLevel.L (5%) QRErrorCorrectLevel.M (15%)
		// QRErrorCorrectLevel.Q (25%) QRErrorCorrectLevel.H (30%)
		// eg. L can survive approx 5% damage...etc.
		var qr = new QRCode(QRCodeVersion, QRErrorCorrectLevel.M);
		qr.addData(text);
		qr.make();
	} catch (err) {
		/*
		 * if( QRCodeVersion < 40 ){ increaseQRCodeVersion(); showQRCode( text );
		 * }else{
		 */
		var errorChild = document.createElement("p");
		var errorMSG = document.createTextNode("QR Code FAIL! " + err);
		errorChild.appendChild(errorMSG);
		return errorChild;
		// }
	}

	var qrsize = qr.getModuleCount();
	canvas.setAttribute('height', (qrsize * dotsize) + padding);
	canvas.setAttribute('width', (qrsize * dotsize) + padding);
	var shiftForPadding = padding / 2;
	if (canvas.getContext) {
		for (var r = 0; r < qrsize; r++) {
			for (var c = 0; c < qrsize; c++) {
				if (qr.isDark(r, c))
					qrCanvasContext.fillStyle = black;
				else
					qrCanvasContext.fillStyle = white;
				qrCanvasContext.fillRect((c * dotsize) + shiftForPadding,
						(r * dotsize) + shiftForPadding, dotsize, dotsize); // x,
																			// y,
																			// w, h
			}
		}
	}
	var imgElement = document.createElement("img");
	imgElement.src = canvas.toDataURL("image/png");
	if ((qrheight > 0) && (qrwidth > 0)) {
		imgElement.width = qrheight;
		imgElement.height = qrwidth;
	}
	svgDiv = document.createElement("div");
	svgDiv.appendChild(qrCanvasContext.getSVG());
	svgOutput = document.createElement("textarea");
	svgOutput.value = svgDiv.innerHTML;
	_SVG = svgOutput.value;
	return imgElement;
}