const avatarInput = document.getElementById("avatarInput");
const avatarPreview = document.getElementById("avatarPreview");

avatarInput.addEventListener("change", function () {

    const file = this.files[0];

    if (!file) return;

    avatarPreview.src = URL.createObjectURL(file);

});