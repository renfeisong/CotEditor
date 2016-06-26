/*
 
 FindPanelController.swift
 
 CotEditor
 https://coteditor.com
 
 Created by 1024jp on 2014-12-30.
 
 ------------------------------------------------------------------------------
 
 © 2014-2016 1024jp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

import Cocoa

class FindPanelController: NSWindowController {
    
    // MARK: Window Controller Methods
    
    /// activate find panel
    override func showWindow(_ sender: AnyObject?) {
        
        // select text in find text field
        if self.window?.firstResponder == self.window?.initialFirstResponder {
            // force reset firstResponder to invoke becomeFirstResponder in FindPanelTextView every time
            // -> `becomeFirstResponder` will not be called on `makeFirstResponder:` if it given object is alrady set as first responder.
            self.window?.makeFirstResponder(nil)
        }
        self.window?.makeFirstResponder(self.window?.initialFirstResponder)
        
        super.showWindow(sender)
    }
    
}
