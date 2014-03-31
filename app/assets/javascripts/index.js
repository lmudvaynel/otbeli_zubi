var collors=['#000000','#f0251b','#7757f9','#ff9933','#2bd900']

function my_1(i) {
  document.getElementById('capt'+i).style.textDecoration='underline';
  document.getElementById('link'+i).style.borderColor=collors[i-1];
}

function my_2(i) {
  document.getElementById('capt'+i).style.textDecoration='none';
  document.getElementById('link'+i).style.borderColor='transparent';
}

function my_3(i) {
  document.getElementById('link'+i).style.borderColor=collors[i-1];
  document.getElementById('capt'+i).style.textDecoration='underline';
}

function my_4(i) {
  document.getElementById('link'+i).style.borderColor='transparent';
  document.getElementById('capt'+i).style.textDecoration='none';
}