.\scripts\restore-packages.ps1
.\scripts\generate-rsp-config.ps1
.\scripts\run-swift-winrt.ps1

[string]::Join("`n", (Get-Content .\Generated\Sources\WindowsFoundation\Windows.Foundation+ABI.swift)).Replace(
    "            _ = try perform(as: __x_ABI_CWindows_CFoundation_CIGuidHelperStatics.self) { pThis in`n                try CHECKED(pThis.pointee.lpVtbl.pointee.Equals(pThis, .init(from: target), .init(from: value), &result))`n            }",
    "            // Removed as a workaround"
) | Set-Content .\Generated\Sources\WindowsFoundation\Windows.Foundation+ABI.swift

[string]::Join("`n", (Get-Content .\Generated\Sources\UWP\Windows.Media+ABI.swift)).Replace(
    "            let $('`')extension$('`')Wrapper = __ABI_Windows_Media.IMediaExtensionWrapper($('`')extension$('`'))`n            let _extension = try! $('`')extension$('`')Wrapper?.toABI { $('$0') }`n            _ = try perform(as: __x_ABI_CWindows_CMedia_CIMediaExtensionManager2.self) { pThis in`n                try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterMediaExtensionForAppService(pThis, _extension, RawPointer(connection)))`n            }",
    "            // Removed as a workaround"
) | Set-Content .\Generated\Sources\UWP\Windows.Media+ABI.swift
