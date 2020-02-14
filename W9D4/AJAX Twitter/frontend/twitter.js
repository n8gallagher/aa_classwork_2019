const FollowToggle = require("./follow_toggle.js");

$(document).ready(() => {
  $("button.follow-toggle").each((index, button) => {
    new FollowToggle(button));
  })
})