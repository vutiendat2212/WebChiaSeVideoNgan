let txtTenDangNhap = document.querySelector("#txtTenDangNhap");
let txtMatKhau = document.querySelector("#txtMatKhau");
let btnDangNhap = document.querySelector("#btnDangNhap");

let LoiRongTxtTenDangNhap = document.querySelector("#LoiRongTxtTenDangNhap");
let LoiRongTxtMatKhau = document.querySelector("#LoiRongTxtMatKhau");
let LoiSaiTaiKhoan = document.querySelector("#LoiSaiTaiKhoan");
btnDangNhap.addEventListener("click", function () {
    if (txtTenDangNhap.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtTenDangNhap.style.display = "block";
        LoiSaiTaiKhoan.innerText = "";
    }
    if (txtMatKhau.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtMatKhau.style.display = "block";
        LoiSaiTaiKhoan.innerText = "";
    }
})

txtTenDangNhap.addEventListener("input", function () {
    LoiRongTxtTenDangNhap.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtMatKhau.addEventListener("input", function () {
    LoiRongTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})