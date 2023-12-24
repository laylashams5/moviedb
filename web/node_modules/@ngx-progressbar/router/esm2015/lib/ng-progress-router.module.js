/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
import { NgModule } from '@angular/core';
import { NG_PROGRESS_ROUTER_CONFIG } from './ng-progress-router.interface';
import { NgProgressRouter } from './ng-progress-router.service';
export class NgProgressRouterModule {
    // Inject the service to activate it
    /**
     * @param {?} ngProgressRouter
     */
    constructor(ngProgressRouter) {
    }
    /**
     * @param {?} config
     * @return {?}
     */
    static withConfig(config) {
        return {
            ngModule: NgProgressRouterModule,
            providers: [
                { provide: NG_PROGRESS_ROUTER_CONFIG, useValue: config }
            ]
        };
    }
}
NgProgressRouterModule.decorators = [
    { type: NgModule, args: [{},] }
];
/** @nocollapse */
NgProgressRouterModule.ctorParameters = () => [
    { type: NgProgressRouter }
];
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibmctcHJvZ3Jlc3Mtcm91dGVyLm1vZHVsZS5qcyIsInNvdXJjZVJvb3QiOiJuZzovL0BuZ3gtcHJvZ3Jlc3NiYXIvcm91dGVyLyIsInNvdXJjZXMiOlsibGliL25nLXByb2dyZXNzLXJvdXRlci5tb2R1bGUudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7OztBQUFBLE9BQU8sRUFBRSxRQUFRLEVBQXVCLE1BQU0sZUFBZSxDQUFDO0FBQzlELE9BQU8sRUFBMEIseUJBQXlCLEVBQUUsTUFBTSxnQ0FBZ0MsQ0FBQztBQUNuRyxPQUFPLEVBQUUsZ0JBQWdCLEVBQUUsTUFBTSw4QkFBOEIsQ0FBQztBQUdoRSxNQUFNLE9BQU8sc0JBQXNCOzs7OztJQUdqQyxZQUFZLGdCQUFrQztJQUM5QyxDQUFDOzs7OztJQUVELE1BQU0sQ0FBQyxVQUFVLENBQUMsTUFBOEI7UUFDOUMsT0FBTztZQUNMLFFBQVEsRUFBRSxzQkFBc0I7WUFDaEMsU0FBUyxFQUFFO2dCQUNULEVBQUUsT0FBTyxFQUFFLHlCQUF5QixFQUFFLFFBQVEsRUFBRSxNQUFNLEVBQUU7YUFDekQ7U0FDRixDQUFDO0lBQ0osQ0FBQzs7O1lBZEYsUUFBUSxTQUFDLEVBQUU7Ozs7WUFGSCxnQkFBZ0IiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgeyBOZ01vZHVsZSwgTW9kdWxlV2l0aFByb3ZpZGVycyB9IGZyb20gJ0Bhbmd1bGFyL2NvcmUnO1xyXG5pbXBvcnQgeyBOZ1Byb2dyZXNzUm91dGVyQ29uZmlnLCBOR19QUk9HUkVTU19ST1VURVJfQ09ORklHIH0gZnJvbSAnLi9uZy1wcm9ncmVzcy1yb3V0ZXIuaW50ZXJmYWNlJztcclxuaW1wb3J0IHsgTmdQcm9ncmVzc1JvdXRlciB9IGZyb20gJy4vbmctcHJvZ3Jlc3Mtcm91dGVyLnNlcnZpY2UnO1xyXG5cclxuQE5nTW9kdWxlKHt9KVxyXG5leHBvcnQgY2xhc3MgTmdQcm9ncmVzc1JvdXRlck1vZHVsZSB7XHJcblxyXG4gIC8vIEluamVjdCB0aGUgc2VydmljZSB0byBhY3RpdmF0ZSBpdFxyXG4gIGNvbnN0cnVjdG9yKG5nUHJvZ3Jlc3NSb3V0ZXI6IE5nUHJvZ3Jlc3NSb3V0ZXIpIHtcclxuICB9XHJcblxyXG4gIHN0YXRpYyB3aXRoQ29uZmlnKGNvbmZpZzogTmdQcm9ncmVzc1JvdXRlckNvbmZpZyk6IE1vZHVsZVdpdGhQcm92aWRlcnMge1xyXG4gICAgcmV0dXJuIHtcclxuICAgICAgbmdNb2R1bGU6IE5nUHJvZ3Jlc3NSb3V0ZXJNb2R1bGUsXHJcbiAgICAgIHByb3ZpZGVyczogW1xyXG4gICAgICAgIHsgcHJvdmlkZTogTkdfUFJPR1JFU1NfUk9VVEVSX0NPTkZJRywgdXNlVmFsdWU6IGNvbmZpZyB9XHJcbiAgICAgIF1cclxuICAgIH07XHJcbiAgfVxyXG59XHJcbiJdfQ==