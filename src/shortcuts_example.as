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
	public class shortcuts_example extends Sprite
	{
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var context:IContext;

		private var log:ILogger;

		public function shortcuts_example()
		{
			context=new Context();
			context.install(MVCSBundle, KeyboardManagerExtension);
			context.configure(new ContextView(this));
			log=context.getLogger(this);
			context.logLevel=LogLevel.INFO;
			context.initialize(onInitialize);
		}

		private function onInitialize():void
		{
			var shortcutManager:IKeyboardManager=context.injector.getInstance(IKeyboardManager);
			shortcutManager.mapGateDown(Keyboard.SHIFT).withKey(Keyboard.A).toListener(onShortcut1);			
		}

		private function onShortcut1():void
		{
			log.info("onShortcut1");
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	}
}
