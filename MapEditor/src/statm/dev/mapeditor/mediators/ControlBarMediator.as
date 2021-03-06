package statm.dev.mapeditor.mediators
{
    import flash.events.MouseEvent;

    import spark.components.Button;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.mediator.Mediator;

    import statm.dev.mapeditor.app.AppNotificationCode;
    import statm.dev.mapeditor.app.AppState;
    import statm.dev.mapeditor.dom.Map;


    /**
     * 菜单条 Mediator，同时控制窗口标题。
     *
     * @author statm
     *
     */
    public class ControlBarMediator extends Mediator
    {
        public static const NAME:String = "ControlBarMediator";

        public function ControlBarMediator(mediatorName:String = null, viewComponent:Object = null)
        {
            super(mediatorName, viewComponent);

            Button(viewComponent.btnNewMapFile).addEventListener(MouseEvent.CLICK, btnNewMapFile_clickHandler);
            Button(viewComponent.btnBrowseMapFile).addEventListener(MouseEvent.CLICK, btnBrowseMapFile_clickHandler);
            Button(viewComponent.btnSaveMapFile).addEventListener(MouseEvent.CLICK, btnSaveMapFile_clickHandler);
            Button(viewComponent.btnCloseMapFile).addEventListener(MouseEvent.CLICK, btnCloseMapFile_clickHandler);
            Button(viewComponent.btnExportXML).addEventListener(MouseEvent.CLICK, btnExportXML_clickHandler);
            Button(viewComponent.btnImportNPC).addEventListener(MouseEvent.CLICK, btnImportNPC_clickHandler);
            Button(viewComponent.btnImportMob).addEventListener(MouseEvent.CLICK, btnImportMob_clickHandler);
            Button(viewComponent.btnImportMineral).addEventListener(MouseEvent.CLICK, btnImportMineral_clickHandler);
            Button(viewComponent.btnImportFx).addEventListener(MouseEvent.CLICK, btnImportFx_clickHandler);
            Button(viewComponent.btnImportDecoration).addEventListener(MouseEvent.CLICK, btnImportDecoration_clickHandler);
        }


        override public function listNotificationInterests():Array
        {
            return [ AppNotificationCode.MAP_DATA_READY, AppNotificationCode.MAP_FILE_SAVED, AppNotificationCode.MAP_DATA_CHANGED, AppNotificationCode.MAP_FILE_CLOSED ];
        }

        override public function handleNotification(notification:INotification):void
        {
            var map:Map = AppState.getCurrentMap();

            switch (notification.getName())
            {
                case AppNotificationCode.MAP_DATA_READY:
                case AppNotificationCode.MAP_FILE_SAVED:
                    map.setDirty(false);
                    break;

                case AppNotificationCode.MAP_DATA_CHANGED:
                    map.setDirty(true);
                    break;
            }
        }

        private function btnNewMapFile_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.CREATE_MAP_FILE);
        }

        private function btnBrowseMapFile_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.BROWSE_MAP_FILE);
        }

        private function btnSaveMapFile_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.SAVE_MAP_FILE);
        }

        private function btnCloseMapFile_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.CLOSE_MAP_FILE);
        }

        private function btnExportXML_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.EXPORT_XML);
        }

        private function btnImportNPC_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.IMPORT_NPC);
        }

        private function btnImportMob_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.IMPORT_MOB);
        }

        private function btnImportMineral_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.IMPORT_MINERAL);
        }

        private function btnImportFx_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.IMPORT_FX);
        }

        private function btnImportDecoration_clickHandler(event:MouseEvent):void
        {
            sendNotification(AppNotificationCode.IMPORT_DECORATION);
        }
    }
}
