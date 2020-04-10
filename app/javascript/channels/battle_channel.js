import consumer from "./consumer"

consumer.subscriptions.create("BattleChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },
  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  },

  attack: function() {
    return this.perform('attack');
  },
});
