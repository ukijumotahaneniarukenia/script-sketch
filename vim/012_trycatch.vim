try
  echo 'start'
  throw 'error!'
  echo 'end'
catch /error!/
  echomsg 'error occured'
endtry
