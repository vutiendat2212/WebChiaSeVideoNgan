let btnDangXuat = document.querySelector("#btnDangXuat");
let btnHuyDangXuat = document.querySelector("#btnHuyDangXuat");
let form_dang_xuat = document.querySelector(".form-dang-xuat");

btnDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "block";
})

btnHuyDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "none";
})

let txtTenDangNhap = document.querySelector("#txtTenDangNhap");
let txtMatKhauCu = document.querySelector("#txtMatKhauCu");
let txtMatKhauMoi = document.querySelector("#txtMatKhauMoi");
let txtNhapLaiMatKhauMoi = document.querySelector("#txtNhapLaiMatKhauMoi");

let LoiRongTenDangNhap = document.querySelector("#LoiRongTenDangNhap");
let LoiRongMatKhauCu = document.querySelector("#LoiRongMatKhauCu");
let LoiLapLaiMatKhau = document.querySelector("#LoiLapLaiMatKhau");
let LoiSaiTaiKhoan = document.querySelector("#LoiSaiTaiKhoan");

let btnXacNhanSuaHoSo_form = document.querySelector("#btnXacNhanSuaHoSo-form");


let btnXacNhanSuaHoSo = document.querySelector("#btnXacNhanSuaHoSo");
let form_xac_nhan_sua_ho_so = document.querySelector(".form-xac-nhan-sua-ho-so");
let btnHuySuaHoSo_form = document.querySelector("#btnHuySuaHoSo-form");

btnXacNhanSuaHoSo.addEventListener("click", function () {
    form_xac_nhan_sua_ho_so.style.display = "block";
})

btnHuySuaHoSo_form.addEventListener("click", function () {
    form_xac_nhan_sua_ho_so.style.display = "none";
})

btnXacNhanSuaHoSo_form.addEventListener("click", function () {
    form_xac_nhan_sua_ho_so.style.display = "none";
    if (txtTenDangNhap.value.trim() == "") {
        event.preventDefault();
        LoiRongTenDangNhap.style.display = "block";
    }
    if (txtMatKhauCu.value.trim() == "") {
        event.preventDefault();
        LoiRongMatKhauCu.style.display = "block";
    }
    if (txtTenDangNhap.value.trim() != "" && txtMatKhauCu.value.trim() != "" && txtMatKhauMoi.value.trim() != txtNhapLaiMatKhauMoi.value.trim()) {
        event.preventDefault();
        LoiLapLaiMatKhau.style.display = "block";
    }
})

txtTenDangNhap.addEventListener("input", function () {
    LoiRongTenDangNhap.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtTenDangNhap.addEventListener("input", function () {
    LoiRongTenDangNhap.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtMatKhauCu.addEventListener("input", function () {
    LoiLapLaiMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtNhapLaiMatKhauMoi.addEventListener("input", function () {
    LoiLapLaiMatKhau.style.display = "none";
})

//let btnTaiLen = document.querySelector("#btnTaiLen");
//let form_tai_len = document.querySelector(".form-tai-len");
//let btnHuyTaiLen = document.querySelector("#btnHuyTaiLen");
//let btnXacNhanTaiLen = document.querySelector("#btnXacNhanTaiLen");
//let file_video = document.querySelector("#file-video");

//let LoiRongVideo = document.querySelector("#LoiRongVideo")

//btnTaiLen.addEventListener("click", function () {
//    form_tai_len.style.display = "block";
//})

//btnHuyTaiLen.addEventListener("click", function () {
//    form_tai_len.style.display = "none";
//    LoiRongVideo.style.display = "none";
//})

//btnXacNhanTaiLen.addEventListener("click", function () {
//    var selectedFile = file_video.files[0];
//    if (!selectedFile) {
//        event.preventDefault();
//        LoiRongVideo.style.display = "block";
//    }
//})

//file_video.addEventListener("change", function () {
//    LoiRongVideo.style.display = "none";
//})

