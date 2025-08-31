import { Controller } from "@hotwired/stimulus"
import { enter, leave } from 'el-transition'

export default class extends Controller {
  static targets = ['dropdown', 'openUserMenu']

  connect() {
    console.log("Header controller connected!")
    console.log("Open user menu target:", this.openUserMenuTarget)
    console.log("Dropdown target:", this.dropdownTarget)
    
    this.openUserMenuTarget.addEventListener("click", (e) => {
      e.preventDefault()
      console.log("Button clicked!")
      this.toggleDropdown()
    })
  }

  toggleDropdown() {
    console.log("Toggling dropdown...")
    if (this.dropdownTarget.classList.contains('hidden')) {
      this.showDropdown()
    } else {
      this.hideDropdown()
    }
  }

  showDropdown() {
    console.log("Showing dropdown")
    this.dropdownTarget.classList.remove('hidden')
    enter(this.dropdownTarget)
  }

  hideDropdown() {
    console.log("Hiding dropdown")
    leave(this.dropdownTarget).then(() => {
      this.dropdownTarget.classList.add('hidden')
    })
  }
}