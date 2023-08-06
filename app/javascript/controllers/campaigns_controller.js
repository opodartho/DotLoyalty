import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  addFields(event) {
    let _element = event.target
    let time = new Date().getTime()
    let regexp = new RegExp(_element.dataset.id, 'g')
    _element.before(this.htmlToElement(_element.dataset.fields.replace(regexp, time)))
    event.preventDefault()
  }

  removeFields(event) {
    let _element = event.target;
    _element.previousElementSibling.value = true;
    _element.parentElement.style.display = 'none';
    event.preventDefault();
  }

  htmlToElement(html) {
    let template = document.createElement('template');
    html = html.trim();
    template.innerHTML = html;
    return template.content.firstChild;
  }
}
