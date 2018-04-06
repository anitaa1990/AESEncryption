//Sample Implementation can be found here: https://jsfiddle.net/4zb9hrxb/1890/

let key = "Q8pTgdOC7h25qKVncJlzDA=="
let message = "TestAnitaa009"
let base64Key = CryptoJS.enc.Base64.parse(key);

var iv = base64Key

let encryptedValue = CryptoJS.AES.encrypt(message, base64Key, {
mode: CryptoJS.mode.CBC,
padding: CryptoJS.pad.Pkcs7,
iv: base64Key
});
