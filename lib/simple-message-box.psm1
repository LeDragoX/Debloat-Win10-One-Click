# Reference: https://michlstechblog.info/blog/powershell-show-a-messagebox/#:~:text=Sometimes%20while%20a%20powershell%20script,NET%20Windows.
Function LoadSysForms {
    # Load assembly
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
}

Function ShowMessage {

    [CmdletBinding()] #<<-- This turns a regular function into an advanced function
    param (
        [String]    $Title = "Insert title here",
        [Array]     $Message = 
        "Crash
         Bandicoot"
    )

    LoadSysForms
    [System.Windows.Forms.MessageBox]::Show($Message, $Title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}

# Demo: ShowMessage -Title "Title" -Message "Message"

Function ShowQuestion {

    param (
        [String]    $Title = "Insert title here",
        [Array]     $Message = 
        "Crash
         Bandicoot"
    )

    LoadSysForms
    $Answer = [System.Windows.Forms.MessageBox]::Show($Message, $Title, [System.Windows.Forms.MessageBoxButtons]::YesNoCancel, [System.Windows.Forms.MessageBoxIcon]::Question)

    return $Answer
}

# Demo: $Question = ShowQuestion -Title "Title" -Message "Message"
# Returns Yes or No or Cancel