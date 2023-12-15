let txtTenDangNhap = document.querySelector("#txtTenDangNhap");
let txtMatKhau = document.querySelector("#txtMatKhau");
let txtNhapLaiMatKhau = document.querySelector("#txtNhapLaiMatKhau");


let LoiRongTxtTenDangNhap = document.querySelector("#LoiRongTxtTenDangNhap");
let LoiRongTxtMatKhau = document.querySelector("#LoiRongTxtMatKhau");
let LoiLapLaiTxtMatKhau = document.querySelector("#LoiLapLaiTxtMatKhau");
let LoiSaiTaiKhoan = document.querySelector("#LoiSaiTaiKhoan");

let btnHuyThemTaiKhoan = document.querySelector("#btnHuyThemTaiKhoan");
let btnXacNhanThemTaiKhoan = document.querySelector("#btnXacNhanThemTaiKhoan");

let btnThemTaiKhoan = document.querySelector("#btnThemTaiKhoan");
let form_them_tai_khoan = document.querySelector(".form-them-tai-khoan");

btnThemTaiKhoan.addEventListener("click", function () {
    form_them_tai_khoan.style.display = "block";
})

btnHuyThemTaiKhoan.addEventListener("click", function () {
    form_them_tai_khoan.style.display = "none";
    LoiRongTxtTenDangNhap.style.display = "none";
    LoiRongTxtMatKhau.style.display = "none";
    LoiLapLaiTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

btnXacNhanThemTaiKhoan.addEventListener("click", function () {
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


let btnDangXuat = document.querySelector("#btnDangXuat");
let btnHuyDangXuat = document.querySelector("#btnHuyDangXuat");
let form_dang_xuat = document.querySelector(".form-dang-xuat");

btnDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "block";
})

btnHuyDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "none";
})


let btnXoaTaiKhoan = document.querySelectorAll("#btnXoaTaiKhoan");
let btnHuyXoaTaiKhoan = document.querySelectorAll("#btnHuyXoaTaiKhoan");

btnXoaTaiKhoan.forEach(function (btn) {
    btn.addEventListener("click", function () {
        btn.parentNode.parentNode.querySelector(".form-xoa-tai-khoan").style.display = "block";
    })
})

btnHuyXoaTaiKhoan.forEach(function (btn) {
    btn.addEventListener("click", function () {
        btn.parentNode.style.display = "none";
    })
})
