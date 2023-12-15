let txtTenDangNhap = document.querySelector("#txtTenDangNhap");
let txtMatKhau = document.querySelector("#txtMatKhau");
let txtNhapLaiMatKhau = document.querySelector("#txtNhapLaiMatKhau");
let txtMST = document.querySelector("#txtMST");
let btnDangKy = document.querySelector("#btnDangKy");

let LoiRongTxtTenDangNhap = document.querySelector("#LoiRongTxtTenDangNhap");
let LoiRongTxtMatKhau = document.querySelector("#LoiRongTxtMatKhau");
let LoiLapLaiTxtMatKhau = document.querySelector("#LoiLapLaiTxtMatKhau");
let LoiSaiTaiKhoan = document.querySelector("#LoiSaiTaiKhoan");
let LoiSaiMST = document.querySelector("#LoiSaiMST");
let LoiRongMST = document.querySelector("#LoiRongMST");

regex = /^(\1|2|3|4|5|6|7|8|9)\{8,}$/;
btnDangKy.addEventListener("click", function () {
    if (txtTenDangNhap.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtTenDangNhap.style.display = "block";
    }
    if (txtMatKhau.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtMatKhau.style.display = "block";
    }
    else if (txtMatKhau.value.trim() != txtNhapLaiMatKhau.value.trim()) {
        event.preventDefault();
        LoiLapLaiTxtMatKhau.style.display = "block";
    }
    if (txtMST.value.trim() == "") {
        event.preventDefault();
        LoiRongMST.style.display = "block";
    }
    else {
        if (isNaN(txtMST.value) || !regex.test(txtMST.value)) {
            event.preventDefault();
            LoiSaiMST.style.display = "block";
        }
        //else {
            //var first = txtMST.value.split();
            //if (isNaN(first[0]) || first[0] == 0) {
               // event.preventDefault();
               // LoiSaiMST.style.display = "block";
            //}
        //}
    }
})

txtMST.addEventListener("input", function () {
    LoiRongMST.style.display = "none";
    LoiSaiMST.style.display = "none";
})

txtTenDangNhap.addEventListener("input", function () {
    LoiRongTxtTenDangNhap.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtMatKhau.addEventListener("input", function () {
    LoiRongTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtNhapLaiMatKhau.addEventListener("input", function () {
    LoiLapLaiTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})
