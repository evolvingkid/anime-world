String descDataFormactor(data) {
  var decription = data.replaceAll('<br>', ' ');
  decription = decription.replaceAll('<i>', ' ');
  return decription = decription.replaceAll('</i>', ' ');
}
