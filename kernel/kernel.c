void main(){
    for (int i = 0; i < 160; i+=2)
    {
        *((char*) 0xb8000+i) = 'X';
    }
}
