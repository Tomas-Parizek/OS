[bits 32]

detect_lm_protected:
    pushad

    pushfd
    pop eax

    mov ecx, eax

    xor eax, 1 << 21

    push eax
    popfd

    pushfd
    pop eax

    push ecx
    popfd

    cmp eax, ecx
    je cpuid_not_found_protected


    mov eax, 0x80000000
    cpuid
    cmp eax, 0x80000001
    jb cpuid_not_found_protected


    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz lm_not_found_protected

    popad
    ret


cpuid_not_found_protected:
    jmp $


lm_not_found_protected:
    jmp $
