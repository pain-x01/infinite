<template>
  <div class="container info-page">
    <div class="container form-container">
      <div class="copy-container">
        <h1>EXTRA! EXTRA! Fresh Cultural Pickins!</h1>
        <h4> * </h4>
        <h4>Simple. Clean. Informative. No ads. </h4>

        <p>
          If it’s happening, and it’s happening - it’s here.
        </p>

        <h4>Curated list of arts and culture events delivered to your mailbox every Wednesday afternoon.</h4>

      </div>

      <div id="mc_embed_signup">
        <form
          action="https://industries.us13.list-manage.com/subscribe/post?u=55944da642302ef43bc8c0f27&amp;id=f571a7e653"
          method="post"
          id="mc-embedded-subscribe-form"
          name="mc-embedded-subscribe-form"
          class="validate"
          target="_blank"
          novalidate
        >
          <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
          <div style="position: absolute; left: -5000px;" aria-hidden="true">
            <input type="text" name="b_55944da642302ef43bc8c0f27_f571a7e653" tabindex="-1" value="">
          </div>

          <div class="submit-container">
            <button type="submit" class="subscribe-button">SUBSCRIBE</button>
          </div>
        </form>
      </div>
      <div class="copy-container" style="padding-top:0px;">
        <p>
          Gallery openings, punk shows, theater, street art, orchestra, museums, hip-hop, dance; it’s all here for you to experience.
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    layout: 'no-subscribe',
    methods: {
      isIos: function () {
        const userAgent = window.navigator.userAgent.toLowerCase()
        return /iphone|ipad|ipod/.test(userAgent)
      }
    },
    mounted: function () {
      const self = this
      document.getElementById('mc-embedded-subscribe-form').onsubmit = function (e) {
        if (!self.isIos()) {
          window.setTimeout(function () {
            window.location = window.location.origin + '/'
          }, 10)
        }
      }
    }
  }
</script>

<style scoped>

  .subscribe-button {
    border: 1px black solid;
    padding: 15px;
    padding-left: 25px;
    padding-right: 25px;
    font-family: "EB Garamond";
    font-size: 1.25em;
    font-weight: bold;
    letter-spacing: 3px;
    background-color:#B7B09C;
  }

  .form-container {
    padding: 10px;
    padding-left: 20px;
    border-radius: 10px;
    color: black;
    background-color: white;
    width: 85%;
  }

  h1, h2, h3 {
    font-family: "Open Sans", sans-serif;
    letter-spacing: .02em;

  }

  h4 {
    font-family: "EB Garamond";
    font-size: 1.5em;
    text-align: center;
    margin-top: 20px;
  }

  h1{
    font-size: 1.9em;
    font-weight: bold;
    margin-bottom: 0.7em;
    text-align: center;
  }

  h2, h3{
    font-size: 1.5em;
    font-weight: 700;
    margin-top: 1.5em;
    margin-bottom: .5em;
  }

  p {
    font-family: "EB Garamond";
    font-size: 1.25em;
    text-align:center;
  }

  .copy-container {
    padding:20px;
    padding-bottom: 0px;
  }

  .copy-container p {
    margin-top: 30px;
    max-width: 500px;
    margin-right: auto;
    margin-left: auto;

  }

  form {
    font-family: "Open Sans", sans-serif;
  }

  form .layout .form-label {
    display: block;
    padding-right: 15px;
    font-size: 1.2em;
    font-weight: bold;
    margin-top: 22px;
    letter-spacing: normal;
    line-height: normal;
  }

  @media only screen and (min-width: 600px) {
    form .layout .form-label {
      text-align: right;
    }
  }

  @media only screen and (max-width: 576px) {

      .form-container {
          padding-left: 0px;
          padding-right: 0px;
      }

      .copy-container {
          padding-left: 0px;
          padding-right: 0px;
      }
  }
  form .submit-container {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 20px;
  }
</style>
