int main(){
    Print("input your name:");
    Print(ReadLine());
    Print("ok bruh now input your age : ->\n", ReadInteger(), "good age? answer is ", true);
    
    if (itob(ReadInteger())){
        Print("ok1 simple if");
    }
    
    if (itob(ReadInteger())){
        Print("wrong");
    }else {
        Print("eyval else ham doroste");
    }
}
