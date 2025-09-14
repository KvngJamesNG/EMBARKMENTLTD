import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateWishlistStatus() {
    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if (isUserLoggedIn == "false") {
      document.querySelector(".js-login").click();
      return;
    }

    // If not wishlisted yet → create
    if (this.element.dataset.status === "false") {
      const userId = this.element.dataset.userId;
      const productId = this.element.dataset.productId;

      this.addProductToWishlist(productId, userId);
    } else {
      // If already wishlisted → delete
      const wishlistId = this.element.dataset.wishlistId; // ✅ saved on create
      if (wishlistId) {
        this.removeProductFromWishlist(wishlistId);
      }
    }
  }

  addProductToWishlist(productId, userId) {
    const params = {
      wishlist: { // ✅ matches Rails strong params
        product_id: productId,
        user_id: userId
      }
    };

    fetch("/api/wishlists", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      "Accept": "application/json",
      body: JSON.stringify(params)
    })
      .then(response => response.json())
      .then(data => {
        // ✅ Save wishlistId from Rails response
        this.element.dataset.status = "true";
        this.element.dataset.wishlistId = data.id;

        // Update UI
        this.element.classList.add("fill-red-600");
        this.element.classList.remove("fill-[rgba(0,0,0,0.5)]");
      })
      .catch(error => console.error(error));
  }

  removeProductFromWishlist(wishlistId) {
  fetch(`/api/wishlists/${wishlistId}`, {
    method: "DELETE",
    headers: { "Content-Type": "application/json", "Accept": "application/json" }
  })
  .then(response => {
    if (!response.ok) throw new Error(`HTTP ${response.status}`);

    // Reset dataset + UI
    this.element.dataset.status = "false";
    this.element.dataset.wishlistId = ""; // ✅ explicitly reset
    this.element.classList.remove("fill-red-600");
    this.element.classList.add("fill-[rgba(0,0,0,0.5)]");
  })
  .catch(error => console.error(error));
}

}
