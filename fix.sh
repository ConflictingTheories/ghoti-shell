
for file in $(find . -type f | grep fish); do


mv $(echo $file) $(echo $file | sed 's/fish/ghoti/g') 

#mv $file $new;

done; 
