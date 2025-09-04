import { Application } from "@hotwired/stimulus"

const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }

// Swiper initialization for each product card (no pagination)
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.swiper').forEach(function(swiperEl) {
    const idMatch = swiperEl.className.match(/swiper-(\d+)/);
    if (idMatch) {
      const productId = idMatch[1];
      new Swiper('.swiper-' + productId, {
        loop: true,
        navigation: {
          nextEl: '.swiper-button-next-' + productId,
          prevEl: '.swiper-button-prev-' + productId,
        }
      });
    }
  });
});