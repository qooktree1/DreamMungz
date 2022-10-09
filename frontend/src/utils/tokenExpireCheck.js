export const TokenExpireCheck = () => {
  // 현재 날짜 & 시간
  const today = new Date()
  const todayYear = today.getFullYear()
  const tmpMonth = today.getMonth() + 1
  const todayMonth = tmpMonth + 1 < 10 ? "0" + tmpMonth : "" + tmpMonth
  const tmpDay = today.getDate()
  const todayDay = tmpDay < 10 ? "0" + tmpDay : "" + tmpDay
  const todayHour = today.getHours()
  const todayMinutes = today.getMinutes()
  const todaySeconds = today.getSeconds()
  const todayYMD = `${todayYear}-${todayMonth}-${todayDay}`

  // 토큰 만료 날짜 & 시간
  const tokenExpiration = localStorage.getItem("expiration")
  const tokenCheckArray = tokenExpiration.split("-")
  const tokenYMD = `${tokenCheckArray[0]}-${tokenCheckArray[1]}-${tokenCheckArray[2]}`

  if (todayYMD > tokenYMD) {
    return true
  } else if (
    todayYMD === tokenYMD &&
    todayHour * 60 * 60 + todayMinutes * 60 + todaySeconds >
      Number(tokenCheckArray[3]) * 60 * 60 +
        Number(tokenCheckArray[4]) * 60 +
        Number(tokenCheckArray[5])
  ) {
    return true
  } else {
    return false
  }
}
