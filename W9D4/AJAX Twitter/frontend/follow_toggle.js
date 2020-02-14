class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = $el.data("user-id");
    this.followState = $el.data("initial-follow-state");
    render();
    handleClick();
  }


  render() {
    if (this.followState === "followed") return "Unfollow!";
    if (this.followState === "unfollowed") return "Follow!";
  }

  handleClick() {

    $("button").click(function(event) {
      event.preventDefault();
      $.ajax({ 
        url: `/users/${this.userId}/follow`,
        method: 'POST',
        dataType: 'JSON',
        success: (res) => console.log(res),
        failure: (err) => console.log(err)
      })
    })

  }
}

module.exports = FollowToggle;

