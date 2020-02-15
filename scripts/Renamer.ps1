# This script take in a text file that is provided OR the default is given
# Renames all file (or directories) other than .txt and .ps1 to its corresponding title in the .txt file

param(
    $textFile = "titles.txt" # The Text File Location that contains all names
)

# Variables Used
$str = (Get-Content $textFile) | Out-String;
$title = ""; # Each Title String
$titleArr = @(); # Array of Each Title


# Function that Loops through the Text File
function loopFile() {
    For($x=0; $x -lt $str.Length; $x++){
        # Check for a New Line Break
        if($str[$x] -match '\n') {
            # Add Title to the Array
            $titleArr += @($title);

            # Clear Title
            $title = "";
        }

        # Add to Title String
        else {
            $title += $str[$x];
        }
    }

    # When Done, Call the Rename Function passing the array
    renameFiles -arr $titleArr
}

# Function that renames all Children Items to it's exact index in the arr parameter
function renameFiles($arr) {
    # Make Sure there is an array
    if($arr.Count -eq 0) {
        return;
    }

    # Assign File Data
    $extIgnore = '(.txt|.ps1)'; # Ignore the .txt and .ps1 files
    $index = 0; # Keep track of each File Index

    Get-ChildItem | ForEach-Object {
        # Object Data
        $fileName = $_.Name;
        $ext = $_.Extension;

        # Make sure file is NOT a match
        if($ext -notmatch $extIgnore){
            # Assign Title to a Variable
            $title = $arr[$index];

            # Clean Up any Invalid Characters
            $title = removeInvalidChars -str $title;
            

            # Add the Extention to file (if any)
            # Just in case there is a Folder
            if($ext -ne ''){
                $title += $ext;
            }


            # Rename each file
            Rename-Item -Path $fileName -NewName "$title"
            

            $index++;
        }
    }
}

# Cleans any Invalid Characters and Returns the new String
function removeInvalidChars($str) {
    $invalidChars = [IO.Path]::GetInvalidFileNameChars() -join '';
    $re = "[{0}]" -f [RegEx]::Escape($invalidChars);

    return ($str -replace $re);
}




loopFile
# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUKDXoc24nHRZS4uRZlyZ9aP4y
# iOmgggNCMIIDPjCCAiqgAwIBAgIQeI4UjHW/goBJUu2bLdM8dDAJBgUrDgMCHQUA
# MCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdDAe
# Fw0xODAxMjMxNjU5MjlaFw0zOTEyMzEyMzU5NTlaMBoxGDAWBgNVBAMTD1Bvd2Vy
# U2hlbGwgVXNlcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANBg9qmI
# Td1AC69KsNvfMVCO/gNIwsqHHG8feTALR5N03/xmK+4n12LipSJYvdrQN8PGtBE7
# nq/IL/qEYbP0Tljis0+JBr4hmjqeR6lWrMf6QKNgwvPONRIa3SzSIz6DnhV4xJI+
# DSMvHSEgc8yjfm8VCH/6qXWt8euW0ArdxH/5v33QGD9uRDWdui7jyhUmwkCthwO8
# uI2AdSZm4Wc2DIs4QPKMTSFlPhQHmk3EdAxdtg9vawTeak62IJA7Mp0LKFmgy865
# j/HeBbImYiUlCdRCzkd35BkWwsO1YRyzGzGE54yuq+icz6Sl7GFC/MnIPt4y2Zxf
# 9ceUwUu/KjJ837UCAwEAAaN2MHQwEwYDVR0lBAwwCgYIKwYBBQUHAwMwXQYDVR0B
# BFYwVIAQ/EqVYwoms6P1Z8QegbdQzqEuMCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwg
# TG9jYWwgQ2VydGlmaWNhdGUgUm9vdIIQaT3EtOSEdYxMx5lkR6laKTAJBgUrDgMC
# HQUAA4IBAQCNv/hKENGf5QKt50vhjjrMOfzDlwPh3e6syJWKxQcoFUfW1I1HSmk2
# SxZS9M6gQ0jpK0ecwKMTv2poTfPlDtG5XKGj4xA/bRX0+AexsekzYTCx5uvbRgM5
# TYvAmHyyy8buF9ufAawGFQYGY9X1DrRtRi24kjLaw/LCrmX9ASzzhP68fRswY9JG
# o1nUZoRcX7Py7ELFTdT3aaHtY2G8ozY+feDrUU0k9946gG7vpa71t2tOGl1lTXNP
# JQXBXCIS4ipEmNAVgIXY6VohbB5nHu++mw8sJGCU2CLtkMWpgdgok9yclgqjs04t
# l6WNhkqVXsJk20/gEcgCp9qdb8R7CMVKMYIB4TCCAd0CAQEwQDAsMSowKAYDVQQD
# EyFQb3dlclNoZWxsIExvY2FsIENlcnRpZmljYXRlIFJvb3QCEHiOFIx1v4KASVLt
# my3TPHQwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJ
# KoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQB
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFBivjhFTCc726VJLKDoh9NMDnIY5MA0GCSqG
# SIb3DQEBAQUABIIBAFImps+rfMMEw2hrU4vEVI4x7fSN7LstrVPTmG1jqBaAKq8K
# ntqhuud3Tmz1dvlZVyzFmMsl1WU8ifVheP69smt67QmZb0bchFlasDM1CLK4ogEJ
# GF0ZBpMdka8Qb548M7ujBLFD73E3Vg0WmPcaHxFXhpCRCJuVzhW7cphzyZrAWBx0
# 2cyvIfwVj72OnTSnSXMSFbmBmgq6nPTuJzcyIcVyuIfJqyg0LB0XAN367B7+u9i+
# Hpv0uV3+w3MiLIqDAMOpwCGYGFeoMB9sguLbrdlvyaXWvz3yxlBy7jG80fTkx2jM
# 78tfEp58f0Kfx8aQj0/l5LexdsG11gSmh+2bwyA=
# SIG # End signature block
