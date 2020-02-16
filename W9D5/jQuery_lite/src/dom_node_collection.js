class DOMNodeCollection {

  constructor (arr) {
    this.arr = arr;
  }

  html(string) {
    if (string) {
      this.arr.forEach((el) => {
        el.innerHTML = string;
      });
    } else {
      return this.arr[0].innerHTML;
    }
  }

  empty() {
    this.html("");
  }

  append(arg) {
    // debugger
    if (typeof(arg) === 'string') {
      this.arr.forEach((el) => {
        el.innerHTML += arg;
      });
    } else if (arg instanceof HTMLElement) {
      const htmlTag = arg.outerHTML;
      this.arr.forEach( (el) => {
        el.innerHTML += htmlTag;
      });
    } else if (arg instanceof DOMNodeCollection) {
      // const htmlTag = arg.outerHTML;
      // let argArr = Array.from(arg);
      this.arr.forEach((el) => {
        for(let i = 0; i < arg.arr.length; i++) {
          el.innerHTML += arg.arr[i].outerHTML;
        }
      });
    }
  }

  attr(selector, value) {
    if (!value) {
      this.arr[0].getAttribute(selector);
    } else {
      this.arr.forEach((el) => {

        el.setAttribute(selector, value);
      });
    }
  }
  addClass(string) {
    this.attr("class", string);
  }
  removeClass() {
    
  }
}

module.exports = DOMNodeCollection;