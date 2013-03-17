/**
 *
 * Copyright 2012(C) by Piotr Kucharski. 
 * email: suspendmode@gmail.com 
 * mobile: +48 791 630 277
 *
 * All rights reserved. Any use, copying, modification, distribution and selling of this software and it's documentation
 * for any purposes without authors' written permission is hereby prohibited.
 *
 */
package
{
    import flash.display.Sprite;
    import flash.ui.Keyboard;
    
    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.ILogger;
    import robotlegs.bender.framework.api.LogLevel;
    import robotlegs.bender.framework.impl.Context;
    import robotlegs.suspendmode.keyboard.KeyboardManagerExtension;
    import robotlegs.suspendmode.keyboard.api.IKeyboardManager;
    
    
    /**
     *
     * @author suspendmode@gmail.com
     *
     */
    public class key_down_up_example extends Sprite
    {
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        private var context:IContext;
        
        private var log: ILogger;
        
        public function key_down_up_example()
        {
            context = new Context();
            context.install(MVCSBundle, KeyboardManagerExtension);
            context.configure(new ContextView(this));
            log = context.getLogger(this);
            context.logLevel = LogLevel.INFO;
            context.initialize(onInitialize);
        }
        
        private function onInitialize():void
        {
            var keyboardManager: IKeyboardManager = context.injector.getInstance(IKeyboardManager);
            keyboardManager.mapKeyDownGate(Keyboard.A).toListener(on_a);
            keyboardManager.mapKeyDownTrigger(Keyboard.B, true).toListener(on_B);
            keyboardManager.mapKeyUpGate(Keyboard.B, false, true).toListener(on_ctrl_b);
            keyboardManager.mapKeyUpTrigger(Keyboard.C, false, false).toListener(on_c);
        }
        
        private function on_c():void
        {            
            log.info("on_c");
        }
        
        private function on_ctrl_b():void
        {
            log.info("on_ctrl_b");
        }
        
        private function on_B():void
        {
            log.info("on_B");
        }
        
        private function on_a():void
        {            
            log.info("on_a");
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }
}