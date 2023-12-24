/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
import * as tslib_1 from "tslib";
import { Injectable, Optional, Inject } from '@angular/core';
import { Router, NavigationStart, NavigationEnd, NavigationCancel, NavigationError } from '@angular/router';
import { of } from 'rxjs';
import { tap, delay, switchMap, filter } from 'rxjs/operators';
import { NgProgress } from '@ngx-progressbar/core';
import { NG_PROGRESS_ROUTER_CONFIG } from './ng-progress-router.interface';
import * as i0 from "@angular/core";
import * as i1 from "@ngx-progressbar/core";
import * as i2 from "@angular/router";
import * as i3 from "./ng-progress-router.interface";
/**
 * Check if a router event type exists in an array of router event types
 * @param {?} routerEvent
 * @param {?} events
 * @return {?}
 */
function eventExists(routerEvent, events) {
    /** @type {?} */
    var res = false;
    events.map((/**
     * @param {?} event
     * @return {?}
     */
    function (event) { return res = res || routerEvent instanceof event; }));
    return res;
}
var NgProgressRouter = /** @class */ (function () {
    function NgProgressRouter(progress, router, config) {
        var _this = this;
        this._config = {
            id: 'root',
            delay: 0,
            startEvents: [NavigationStart],
            completeEvents: [NavigationEnd, NavigationCancel, NavigationError]
        };
        this._config = config ? tslib_1.__assign({}, this._config, config) : this._config;
        /** @type {?} */
        var progressRef = progress.ref(this._config.id);
        /** @type {?} */
        var startProgress = of({}).pipe(tap((/**
         * @return {?}
         */
        function () { return progressRef.start(); })));
        /** @type {?} */
        var completeProgress = of({}).pipe(delay(this._config.delay), tap((/**
         * @return {?}
         */
        function () { return progressRef.complete(); })));
        /** @type {?} */
        var filterEvents = tslib_1.__spread(this._config.startEvents, this._config.completeEvents);
        router.events.pipe(filter((/**
         * @param {?} event
         * @return {?}
         */
        function (event) { return eventExists(event, filterEvents); })), switchMap((/**
         * @param {?} event
         * @return {?}
         */
        function (event) { return eventExists(event, _this._config.startEvents) ? startProgress : completeProgress; }))).subscribe();
    }
    NgProgressRouter.decorators = [
        { type: Injectable, args: [{
                    providedIn: 'root'
                },] }
    ];
    /** @nocollapse */
    NgProgressRouter.ctorParameters = function () { return [
        { type: NgProgress },
        { type: Router },
        { type: undefined, decorators: [{ type: Optional }, { type: Inject, args: [NG_PROGRESS_ROUTER_CONFIG,] }] }
    ]; };
    /** @nocollapse */ NgProgressRouter.ngInjectableDef = i0.defineInjectable({ factory: function NgProgressRouter_Factory() { return new NgProgressRouter(i0.inject(i1.NgProgress), i0.inject(i2.Router), i0.inject(i3.NG_PROGRESS_ROUTER_CONFIG, 8)); }, token: NgProgressRouter, providedIn: "root" });
    return NgProgressRouter;
}());
export { NgProgressRouter };
if (false) {
    /**
     * @type {?}
     * @private
     */
    NgProgressRouter.prototype._config;
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibmctcHJvZ3Jlc3Mtcm91dGVyLnNlcnZpY2UuanMiLCJzb3VyY2VSb290Ijoibmc6Ly9Abmd4LXByb2dyZXNzYmFyL3JvdXRlci8iLCJzb3VyY2VzIjpbImxpYi9uZy1wcm9ncmVzcy1yb3V0ZXIuc2VydmljZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7OztBQUFBLE9BQU8sRUFBRSxVQUFVLEVBQUUsUUFBUSxFQUFFLE1BQU0sRUFBUSxNQUFNLGVBQWUsQ0FBQztBQUNuRSxPQUFPLEVBQUUsTUFBTSxFQUFFLGVBQWUsRUFBRSxhQUFhLEVBQUUsZ0JBQWdCLEVBQUUsZUFBZSxFQUFlLE1BQU0saUJBQWlCLENBQUM7QUFDekgsT0FBTyxFQUFFLEVBQUUsRUFBRSxNQUFNLE1BQU0sQ0FBQztBQUMxQixPQUFPLEVBQUUsR0FBRyxFQUFFLEtBQUssRUFBRSxTQUFTLEVBQUUsTUFBTSxFQUFFLE1BQU0sZ0JBQWdCLENBQUM7QUFDL0QsT0FBTyxFQUFFLFVBQVUsRUFBRSxNQUFNLHVCQUF1QixDQUFDO0FBQ25ELE9BQU8sRUFBMEIseUJBQXlCLEVBQUUsTUFBTSxnQ0FBZ0MsQ0FBQzs7Ozs7Ozs7Ozs7QUFPbkcsU0FBUyxXQUFXLENBQUMsV0FBd0IsRUFBRSxNQUEyQjs7UUFDcEUsR0FBRyxHQUFHLEtBQUs7SUFDZixNQUFNLENBQUMsR0FBRzs7OztJQUFDLFVBQUMsS0FBd0IsSUFBSyxPQUFBLEdBQUcsR0FBRyxHQUFHLElBQUksV0FBVyxZQUFZLEtBQUssRUFBekMsQ0FBeUMsRUFBQyxDQUFDO0lBQ3BGLE9BQU8sR0FBRyxDQUFDO0FBQ2IsQ0FBQztBQUVEO0lBV0UsMEJBQVksUUFBb0IsRUFBRSxNQUFjLEVBQWlELE1BQThCO1FBQS9ILGlCQW1CQztRQTFCZ0IsWUFBTyxHQUEyQjtZQUNqRCxFQUFFLEVBQUUsTUFBTTtZQUNWLEtBQUssRUFBRSxDQUFDO1lBQ1IsV0FBVyxFQUFFLENBQUMsZUFBZSxDQUFDO1lBQzlCLGNBQWMsRUFBRSxDQUFDLGFBQWEsRUFBRSxnQkFBZ0IsRUFBRSxlQUFlLENBQUM7U0FDbkUsQ0FBQztRQUdBLElBQUksQ0FBQyxPQUFPLEdBQUcsTUFBTSxDQUFDLENBQUMsc0JBQUssSUFBSSxDQUFDLE9BQU8sRUFBSyxNQUFNLEVBQUUsQ0FBQyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUM7O1lBQzlELFdBQVcsR0FBRyxRQUFRLENBQUMsR0FBRyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsRUFBRSxDQUFDOztZQUUzQyxhQUFhLEdBQUcsRUFBRSxDQUFDLEVBQUUsQ0FBQyxDQUFDLElBQUksQ0FDL0IsR0FBRzs7O1FBQUMsY0FBTSxPQUFBLFdBQVcsQ0FBQyxLQUFLLEVBQUUsRUFBbkIsQ0FBbUIsRUFBQyxDQUMvQjs7WUFFSyxnQkFBZ0IsR0FBRyxFQUFFLENBQUMsRUFBRSxDQUFDLENBQUMsSUFBSSxDQUNsQyxLQUFLLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUMsRUFDekIsR0FBRzs7O1FBQUMsY0FBTSxPQUFBLFdBQVcsQ0FBQyxRQUFRLEVBQUUsRUFBdEIsQ0FBc0IsRUFBQyxDQUNsQzs7WUFFSyxZQUFZLG9CQUFPLElBQUksQ0FBQyxPQUFPLENBQUMsV0FBVyxFQUFLLElBQUksQ0FBQyxPQUFPLENBQUMsY0FBYyxDQUFDO1FBRWxGLE1BQU0sQ0FBQyxNQUFNLENBQUMsSUFBSSxDQUNoQixNQUFNOzs7O1FBQUMsVUFBQyxLQUFrQixJQUFLLE9BQUEsV0FBVyxDQUFDLEtBQUssRUFBRSxZQUFZLENBQUMsRUFBaEMsQ0FBZ0MsRUFBQyxFQUNoRSxTQUFTOzs7O1FBQUMsVUFBQyxLQUFrQixJQUFLLE9BQUEsV0FBVyxDQUFDLEtBQUssRUFBRSxLQUFJLENBQUMsT0FBTyxDQUFDLFdBQVcsQ0FBQyxDQUFDLENBQUMsQ0FBQyxhQUFhLENBQUMsQ0FBQyxDQUFDLGdCQUFnQixFQUEvRSxDQUErRSxFQUFDLENBQ25ILENBQUMsU0FBUyxFQUFFLENBQUM7SUFDaEIsQ0FBQzs7Z0JBOUJGLFVBQVUsU0FBQztvQkFDVixVQUFVLEVBQUUsTUFBTTtpQkFDbkI7Ozs7Z0JBaEJRLFVBQVU7Z0JBSFYsTUFBTTtnREE0QnNDLFFBQVEsWUFBSSxNQUFNLFNBQUMseUJBQXlCOzs7MkJBN0JqRztDQWlEQyxBQS9CRCxJQStCQztTQTVCWSxnQkFBZ0I7Ozs7OztJQUMzQixtQ0FLRSIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7IEluamVjdGFibGUsIE9wdGlvbmFsLCBJbmplY3QsIFR5cGUgfSBmcm9tICdAYW5ndWxhci9jb3JlJztcclxuaW1wb3J0IHsgUm91dGVyLCBOYXZpZ2F0aW9uU3RhcnQsIE5hdmlnYXRpb25FbmQsIE5hdmlnYXRpb25DYW5jZWwsIE5hdmlnYXRpb25FcnJvciwgUm91dGVyRXZlbnQgfSBmcm9tICdAYW5ndWxhci9yb3V0ZXInO1xyXG5pbXBvcnQgeyBvZiB9IGZyb20gJ3J4anMnO1xyXG5pbXBvcnQgeyB0YXAsIGRlbGF5LCBzd2l0Y2hNYXAsIGZpbHRlciB9IGZyb20gJ3J4anMvb3BlcmF0b3JzJztcclxuaW1wb3J0IHsgTmdQcm9ncmVzcyB9IGZyb20gJ0BuZ3gtcHJvZ3Jlc3NiYXIvY29yZSc7XHJcbmltcG9ydCB7IE5nUHJvZ3Jlc3NSb3V0ZXJDb25maWcsIE5HX1BST0dSRVNTX1JPVVRFUl9DT05GSUcgfSBmcm9tICcuL25nLXByb2dyZXNzLXJvdXRlci5pbnRlcmZhY2UnO1xyXG5cclxuLyoqXHJcbiAqIENoZWNrIGlmIGEgcm91dGVyIGV2ZW50IHR5cGUgZXhpc3RzIGluIGFuIGFycmF5IG9mIHJvdXRlciBldmVudCB0eXBlc1xyXG4gKiBAcGFyYW0gcm91dGVyRXZlbnRcclxuICogQHBhcmFtIGV2ZW50c1xyXG4gKi9cclxuZnVuY3Rpb24gZXZlbnRFeGlzdHMocm91dGVyRXZlbnQ6IFJvdXRlckV2ZW50LCBldmVudHM6IFR5cGU8Um91dGVyRXZlbnQ+W10pIHtcclxuICBsZXQgcmVzID0gZmFsc2U7XHJcbiAgZXZlbnRzLm1hcCgoZXZlbnQ6IFR5cGU8Um91dGVyRXZlbnQ+KSA9PiByZXMgPSByZXMgfHwgcm91dGVyRXZlbnQgaW5zdGFuY2VvZiBldmVudCk7XHJcbiAgcmV0dXJuIHJlcztcclxufVxyXG5cclxuQEluamVjdGFibGUoe1xyXG4gIHByb3ZpZGVkSW46ICdyb290J1xyXG59KVxyXG5leHBvcnQgY2xhc3MgTmdQcm9ncmVzc1JvdXRlciB7XHJcbiAgcHJpdmF0ZSByZWFkb25seSBfY29uZmlnOiBOZ1Byb2dyZXNzUm91dGVyQ29uZmlnID0ge1xyXG4gICAgaWQ6ICdyb290JyxcclxuICAgIGRlbGF5OiAwLFxyXG4gICAgc3RhcnRFdmVudHM6IFtOYXZpZ2F0aW9uU3RhcnRdLFxyXG4gICAgY29tcGxldGVFdmVudHM6IFtOYXZpZ2F0aW9uRW5kLCBOYXZpZ2F0aW9uQ2FuY2VsLCBOYXZpZ2F0aW9uRXJyb3JdXHJcbiAgfTtcclxuXHJcbiAgY29uc3RydWN0b3IocHJvZ3Jlc3M6IE5nUHJvZ3Jlc3MsIHJvdXRlcjogUm91dGVyLCBAT3B0aW9uYWwoKSBASW5qZWN0KE5HX1BST0dSRVNTX1JPVVRFUl9DT05GSUcpIGNvbmZpZzogTmdQcm9ncmVzc1JvdXRlckNvbmZpZykge1xyXG4gICAgdGhpcy5fY29uZmlnID0gY29uZmlnID8gey4uLnRoaXMuX2NvbmZpZywgLi4uY29uZmlnfSA6IHRoaXMuX2NvbmZpZztcclxuICAgIGNvbnN0IHByb2dyZXNzUmVmID0gcHJvZ3Jlc3MucmVmKHRoaXMuX2NvbmZpZy5pZCk7XHJcblxyXG4gICAgY29uc3Qgc3RhcnRQcm9ncmVzcyA9IG9mKHt9KS5waXBlKFxyXG4gICAgICB0YXAoKCkgPT4gcHJvZ3Jlc3NSZWYuc3RhcnQoKSlcclxuICAgICk7XHJcblxyXG4gICAgY29uc3QgY29tcGxldGVQcm9ncmVzcyA9IG9mKHt9KS5waXBlKFxyXG4gICAgICBkZWxheSh0aGlzLl9jb25maWcuZGVsYXkpLFxyXG4gICAgICB0YXAoKCkgPT4gcHJvZ3Jlc3NSZWYuY29tcGxldGUoKSlcclxuICAgICk7XHJcblxyXG4gICAgY29uc3QgZmlsdGVyRXZlbnRzID0gWy4uLnRoaXMuX2NvbmZpZy5zdGFydEV2ZW50cywgLi4udGhpcy5fY29uZmlnLmNvbXBsZXRlRXZlbnRzXTtcclxuXHJcbiAgICByb3V0ZXIuZXZlbnRzLnBpcGUoXHJcbiAgICAgIGZpbHRlcigoZXZlbnQ6IFJvdXRlckV2ZW50KSA9PiBldmVudEV4aXN0cyhldmVudCwgZmlsdGVyRXZlbnRzKSksXHJcbiAgICAgIHN3aXRjaE1hcCgoZXZlbnQ6IFJvdXRlckV2ZW50KSA9PiBldmVudEV4aXN0cyhldmVudCwgdGhpcy5fY29uZmlnLnN0YXJ0RXZlbnRzKSA/IHN0YXJ0UHJvZ3Jlc3MgOiBjb21wbGV0ZVByb2dyZXNzKVxyXG4gICAgKS5zdWJzY3JpYmUoKTtcclxuICB9XHJcbn1cclxuIl19