import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

updateWishlistStatus(){
    // Check if user is logged in
    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if(isUserLoggedIn == "false"){
      document.querySelector(".js-login").click();
      return; // Exit if user is not logged in
    }




      if (this.element.dataset.status === "false") {
      this.element.classList.add("fill-red-600");
      this.element.classList.remove("fill-[rgba(0,0,0,0.5)]");
      this.element.dataset.status = "true";
    } else {
      this.element.classList.remove("fill-red-600");
      this.element.classList.add("fill-[rgba(0,0,0,0.5)]");
      this.element.dataset.status = "false";
    }
  }
}