const DOMNodeCollection = require('./dom_node_collection')
function $1(ele) {
  if (typeof(ele) === 'string') {
    let nodeList = document.querySelectorAll(ele);
    let arr = Array.from(nodeList);
    return new DOMNodeCollection(arr);
  } else if (typeof(ele) === 'HTMLElement') {
    let arr = Array.from(ele);
    return new DOMNodeCollection(arr);
  }
};



window.$1 = $1;