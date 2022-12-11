section .data
    format_string db "My name is: %s", 0xa, "And my surname: %s",0xa, "Not random char: %c",  0
    string_to_print_1 db "borukh", 0
    string_to_print_2 db "Sokolov", 0
    char_to_print db "!", 0xb
   
section .text

global _start

_start:

    ; поместите строчки, которые хотите вывести, в стек, в обратном порядкке
    push char_to_print
    push string_to_print_2
    push string_to_print_1
    ;поместите в edi строчку формата
    mov edi, format_string
    

    ;вызов функции
    call print

print:
    push ebp
    mov ebp, esp
    add ebp, 4
	jmp start_print
	
start_print: ; цикл по всей строке до нуля

  cmp byte[edi], 0
  je end_ret
  
  cmp byte[edi], 0x25
  je check_format
  
  mov ecx, edi
  mov ebx, 1
  mov edx, 1
  mov eax,4
  int 0x80
  
  inc edi
  
  jmp start_print

check_format:
    inc edi 

    cmp byte[edi], 0x73
    je print_smth
    
    cmp byte[edi], 0x63
    je print_smth
    
    jmp start_print

print_smth:
    inc edi
    
    add ebp, 4 
   
    mov esi, [ebp]
    ;add ebp, 4
   

    jmp print_loop
    
print_loop:
    cmp byte[esi], 0
    je end_print_loop
   
    mov ecx, esi
    mov ebx, 1
    mov edx, 1
    mov eax,4
    int 0x80
  
    inc esi
    jmp print_loop
    
end_print_loop:
    jmp start_print

end_ret:

    mov     eax, 1
    mov     ebx, 0
    int     0x80
  
