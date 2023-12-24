/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
import { NgModule } from '@angular/core';
import { NG_PROGRESS_ROUTER_CONFIG } from './ng-progress-router.interface';
import { NgProgressRouter } from './ng-progress-router.service';
var NgProgressRouterModule = /** @class */ (function () {
    // Inject the service to activate it
    function NgProgressRouterModule(ngProgressRouter) {
    }
    /**
     * @param {?} config
     * @return {?}
     */
    NgProgressRouterModule.withConfig = /**
     * @param {?} config
     * @return {?}
     */
    function (config) {
        return {
            ngModule: NgProgressRouterModule,
            providers: [
                { provide: NG_PROGRESS_ROUTER_CONFIG, useValue: config }
            ]
        };
    };
    NgProgressRouterModule.decorators = [
        { type: NgModule, args: [{},] }
    ];
    /** @nocollapse */
    NgProgressRouterModule.ctorParameters = function () { return [
        { type: NgProgressRouter }
    ]; };
    return NgProgressRouterModule;
}());
export { NgProgressRouterModule };
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibmctcHJvZ3Jlc3Mtcm91dGVyLm1vZHVsZS5qcyIsInNvdXJjZVJvb3QiOiJuZzovL0BuZ3gtcHJvZ3Jlc3NiYXIvcm91dGVyLyIsInNvdXJjZXMiOlsibGliL25nLXByb2dyZXNzLXJvdXRlci5tb2R1bGUudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7OztBQUFBLE9BQU8sRUFBRSxRQUFRLEVBQXVCLE1BQU0sZUFBZSxDQUFDO0FBQzlELE9BQU8sRUFBMEIseUJBQXlCLEVBQUUsTUFBTSxnQ0FBZ0MsQ0FBQztBQUNuRyxPQUFPLEVBQUUsZ0JBQWdCLEVBQUUsTUFBTSw4QkFBOEIsQ0FBQztBQUVoRTtJQUdFLG9DQUFvQztJQUNwQyxnQ0FBWSxnQkFBa0M7SUFDOUMsQ0FBQzs7Ozs7SUFFTSxpQ0FBVTs7OztJQUFqQixVQUFrQixNQUE4QjtRQUM5QyxPQUFPO1lBQ0wsUUFBUSxFQUFFLHNCQUFzQjtZQUNoQyxTQUFTLEVBQUU7Z0JBQ1QsRUFBRSxPQUFPLEVBQUUseUJBQXlCLEVBQUUsUUFBUSxFQUFFLE1BQU0sRUFBRTthQUN6RDtTQUNGLENBQUM7SUFDSixDQUFDOztnQkFkRixRQUFRLFNBQUMsRUFBRTs7OztnQkFGSCxnQkFBZ0I7O0lBaUJ6Qiw2QkFBQztDQUFBLEFBZkQsSUFlQztTQWRZLHNCQUFzQiIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7IE5nTW9kdWxlLCBNb2R1bGVXaXRoUHJvdmlkZXJzIH0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XHJcbmltcG9ydCB7IE5nUHJvZ3Jlc3NSb3V0ZXJDb25maWcsIE5HX1BST0dSRVNTX1JPVVRFUl9DT05GSUcgfSBmcm9tICcuL25nLXByb2dyZXNzLXJvdXRlci5pbnRlcmZhY2UnO1xyXG5pbXBvcnQgeyBOZ1Byb2dyZXNzUm91dGVyIH0gZnJvbSAnLi9uZy1wcm9ncmVzcy1yb3V0ZXIuc2VydmljZSc7XHJcblxyXG5ATmdNb2R1bGUoe30pXHJcbmV4cG9ydCBjbGFzcyBOZ1Byb2dyZXNzUm91dGVyTW9kdWxlIHtcclxuXHJcbiAgLy8gSW5qZWN0IHRoZSBzZXJ2aWNlIHRvIGFjdGl2YXRlIGl0XHJcbiAgY29uc3RydWN0b3IobmdQcm9ncmVzc1JvdXRlcjogTmdQcm9ncmVzc1JvdXRlcikge1xyXG4gIH1cclxuXHJcbiAgc3RhdGljIHdpdGhDb25maWcoY29uZmlnOiBOZ1Byb2dyZXNzUm91dGVyQ29uZmlnKTogTW9kdWxlV2l0aFByb3ZpZGVycyB7XHJcbiAgICByZXR1cm4ge1xyXG4gICAgICBuZ01vZHVsZTogTmdQcm9ncmVzc1JvdXRlck1vZHVsZSxcclxuICAgICAgcHJvdmlkZXJzOiBbXHJcbiAgICAgICAgeyBwcm92aWRlOiBOR19QUk9HUkVTU19ST1VURVJfQ09ORklHLCB1c2VWYWx1ZTogY29uZmlnIH1cclxuICAgICAgXVxyXG4gICAgfTtcclxuICB9XHJcbn1cclxuIl19