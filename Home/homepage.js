const overlay = document.getElementById("overlay");

const loginBtn = document.getElementById("loginBtn");

const closeBtn = document.querySelector(".close");

loginBtn.onclick = () => {
    overlay.classList.add("show");
};

closeBtn.onclick = () => {
    overlay.classList.remove("show");
};

// Bấm ra ngoài modal để đóng
overlay.onclick = (e) => {
    if (e.target === overlay) {
        overlay.classList.remove("show");
    }
};
const nav = document.querySelector(".hd-nav-bar-grid");

const navTop = nav.offsetTop;

window.addEventListener("scroll", () => {

    if(window.scrollY >= navTop){
        nav.classList.add("fixed");
    }else{
        nav.classList.remove("fixed");
    }

});
const menu =()=> {
    const navToggleBtn = document.getElementById("hd-mobile-nav-toggle");
    const navBar = document.querySelector(".hd-nav-bar-grid");
 
       if (navBar && navToggleBtn) {
        // Chạy hiệu ứng ngay lập tức trong lần bấm đầu tiên
        navBar.classList.toggle("hd-nav-bar-mobile-open");
        navToggleBtn.classList.toggle("active");
    }
}
