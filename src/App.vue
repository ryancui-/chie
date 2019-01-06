<template>
  <div id="app">
    <img src="@/assets/lover_mini.jpeg" 
         class="lover-image"
         alt="爱爱图片">
    <div class="time-box">
      <div class="time-box__text">我们相爱了</div>
      <div class="time-box__calculating">
        <span class="time-box__calculating-number">{{ day }}</span>
        <span class="time-box__calculating-label">日</span>
        <span class="time-box__calculating-number">{{ hour }}</span>
        <span class="time-box__calculating-label">时</span>
        <span class="time-box__calculating-number">{{ minute }}</span>
        <span class="time-box__calculating-label">分</span>
        <span class="time-box__calculating-number">{{ second }}</span>
        <span class="time-box__calculating-label">秒</span>
      </div>
      <div class="time-box__text">这么久啦~</div>
    </div>
    <div class="footer">Power By 李猜猜©Copyright</div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data() {
    return {
      startDate: null,
      day: '',
      hour: '',
      minute: '',
      second: '',
      intervalId: null
    }
  },
  created() {
    // Get our first day
    this.startDate = new Date()
    this.startDate.setFullYear(2018, 4, 30)
    this.startDate.setHours(18, 0, 0)

    this.update()
    this.intervalId = setInterval(() => {
      this.update()
    }, 1000)
  },
  beforeDestroy() {
    clearInterval(this.intervalId)
  },
  methods: {
    // Calculate the diff time
    update() {
      const between = Math.floor((Date.now() - this.startDate.getTime()) / 1000)

      this.day = Math.floor(between / (60 * 60 * 24))
      this.hour = Math.floor((between - this.day * (60 * 60 * 24)) / (60 * 60))
      this.minute = Math.floor((between - this.day * (60 * 60 * 24) - this.hour * (60 * 60)) / 60)
      this.second = between - this.day * (60 * 60 * 24) - this.hour * (60 * 60) - this.minute * 60;
    }
  }
}
</script>

<style lang="less">
html, body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  overflow: auto;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

#app {
  max-width: 400px;
  min-width: 370px;
  height: 100%;
  margin: 0 auto;

  .lover-image {
    width: 100%;
  }

  .time-box {
    margin-top: 20px;
    .time-box__text {
      font-size: 20px;
      text-align: center;
      color: rgb(0, 146, 243);
      margin: 20px 0;
    }
    .time-box__calculating {
      display: flex;
      align-items: center;
      justify-content: center;
      .time-box__calculating-number {
        width: 60px;
        text-align: center;
        font-size: 28px;
        color: pink;
      }
      .time-box__calculating-label {
        font-size: 16px;
        color: rgba(0, 0, 0, 0.4);
      }
    }
  }

  .footer {
    position: fixed;
    bottom: 5px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 12px;
    color: rgba(0, 0, 0, 0.4);
    &:before {
      content: '';
      border-top: 1px solid rgba(0, 0, 0, 0.4);
      width: 20px;
      height: 0;
      position: absolute;
      top: 8px;
      left: -25px;
    }
    &:after {
      content: '';
      border-top: 1px solid rgba(0, 0, 0, 0.4);
      width: 20px;
      height: 0;
      position: absolute;
      top: 8px;
      right: -25px;
    }
  }
}


</style>
