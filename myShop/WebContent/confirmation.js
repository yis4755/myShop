/**
 * 
 */

function check() {
	var id = document.getElementById("id").value;
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var price = document.getElementById("price").value;
	
	if(id == "") {
		alert("상품 아이디를 입력해 주세요")
	} else if(title == "") {
		alert("상품 이름을 입력해 주세요")
	} else if(content == "") {
		alert("상품 내용 입력해 주세요")
	} else if(price == "") {
		alert("상품 가격을 입력해 주세요")
	} else {
		location.href = "insert.jsp?id=" + id + "&title=" + title + "&content=" + content + "&price=" + price;
	}
	
}