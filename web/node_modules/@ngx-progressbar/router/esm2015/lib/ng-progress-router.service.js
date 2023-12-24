/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
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
    let res = false;
    events.map((/**
     * @param {?} event
     * @return {?}
     */
    (event) => res = res || routerEvent instanceof event));
    return res;
}
export class NgProgressRouter {
    /**
     * @param {?} progress
     * @param {?} router
     * @param {?} config
     */
    constructor(progress, router, config) {
        this._config = {
            id: 'root',
            delay: 0,
            startEvents: [NavigationStart],
            completeEvents: [NavigationEnd, NavigationCancel, NavigationError]
        };
        this._config = config ? Object.assign({}, this._config, config) : this._config;
        /** @type {?} */
        const progressRef = progress.ref(this._config.id);
        /** @type {?} */
        const startProgress = of({}).pipe(tap((/**
         * @return {?}
         */
        () => progressRef.start())));
        /** @type {?} */
        const completeProgress = of({}).pipe(delay(this._config.delay), tap((/**
         * @return {?}
         */
        () => progressRef.complete())));
        /** @type {?} */
        const filterEvents = [...this._config.startEvents, ...this._config.completeEvents];
        router.events.pipe(filter((/**
         * @param {?} event
         * @return {?}
         */
        (event) => eventExists(event, filterEvents))), switchMap((/**
         * @param {?} event
         * @return {?}
         */
        (event) => eventExists(event, this._config.startEvents) ? startProgress : completeProgress))).subscribe();
    }
}
NgProgressRouter.decorators = [
    { type: Injectable, args: [{
                providedIn: 'root'
            },] }
];
/** @nocollapse */
NgProgressRouter.ctorParameters = () => [
    { type: NgProgress },
    { type: Router },
    { type: undefined, decorators: [{ type: Optional }, { type: Inject, args: [NG_PROGRESS_ROUTER_CONFIG,] }] }
];
/** @nocollapse */ NgProgressRouter.ngInjectableDef = i0.defineInjectable({ factory: function NgProgressRouter_Factory() { return new NgProgressRouter(i0.inject(i1.NgProgress), i0.inject(i2.Router), i0.inject(i3.NG_PROGRESS_ROUTER_CONFIG, 8)); }, token: NgProgressRouter, providedIn: "root" });
if (false) {
    /**
     * @type {?}
     * @private
     */
    NgProgressRouter.prototype._config;
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibmctcHJvZ3Jlc3Mtcm91dGVyLnNlcnZpY2UuanMiLCJzb3VyY2VSb290Ijoibmc6Ly9Abmd4LXByb2dyZXNzYmFyL3JvdXRlci8iLCJzb3VyY2VzIjpbImxpYi9uZy1wcm9ncmVzcy1yb3V0ZXIuc2VydmljZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7O0FBQUEsT0FBTyxFQUFFLFVBQVUsRUFBRSxRQUFRLEVBQUUsTUFBTSxFQUFRLE1BQU0sZUFBZSxDQUFDO0FBQ25FLE9BQU8sRUFBRSxNQUFNLEVBQUUsZUFBZSxFQUFFLGFBQWEsRUFBRSxnQkFBZ0IsRUFBRSxlQUFlLEVBQWUsTUFBTSxpQkFBaUIsQ0FBQztBQUN6SCxPQUFPLEVBQUUsRUFBRSxFQUFFLE1BQU0sTUFBTSxDQUFDO0FBQzFCLE9BQU8sRUFBRSxHQUFHLEVBQUUsS0FBSyxFQUFFLFNBQVMsRUFBRSxNQUFNLEVBQUUsTUFBTSxnQkFBZ0IsQ0FBQztBQUMvRCxPQUFPLEVBQUUsVUFBVSxFQUFFLE1BQU0sdUJBQXVCLENBQUM7QUFDbkQsT0FBTyxFQUEwQix5QkFBeUIsRUFBRSxNQUFNLGdDQUFnQyxDQUFDOzs7Ozs7Ozs7OztBQU9uRyxTQUFTLFdBQVcsQ0FBQyxXQUF3QixFQUFFLE1BQTJCOztRQUNwRSxHQUFHLEdBQUcsS0FBSztJQUNmLE1BQU0sQ0FBQyxHQUFHOzs7O0lBQUMsQ0FBQyxLQUF3QixFQUFFLEVBQUUsQ0FBQyxHQUFHLEdBQUcsR0FBRyxJQUFJLFdBQVcsWUFBWSxLQUFLLEVBQUMsQ0FBQztJQUNwRixPQUFPLEdBQUcsQ0FBQztBQUNiLENBQUM7QUFLRCxNQUFNLE9BQU8sZ0JBQWdCOzs7Ozs7SUFRM0IsWUFBWSxRQUFvQixFQUFFLE1BQWMsRUFBaUQsTUFBOEI7UUFQOUcsWUFBTyxHQUEyQjtZQUNqRCxFQUFFLEVBQUUsTUFBTTtZQUNWLEtBQUssRUFBRSxDQUFDO1lBQ1IsV0FBVyxFQUFFLENBQUMsZUFBZSxDQUFDO1lBQzlCLGNBQWMsRUFBRSxDQUFDLGFBQWEsRUFBRSxnQkFBZ0IsRUFBRSxlQUFlLENBQUM7U0FDbkUsQ0FBQztRQUdBLElBQUksQ0FBQyxPQUFPLEdBQUcsTUFBTSxDQUFDLENBQUMsbUJBQUssSUFBSSxDQUFDLE9BQU8sRUFBSyxNQUFNLEVBQUUsQ0FBQyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUM7O2NBQzlELFdBQVcsR0FBRyxRQUFRLENBQUMsR0FBRyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsRUFBRSxDQUFDOztjQUUzQyxhQUFhLEdBQUcsRUFBRSxDQUFDLEVBQUUsQ0FBQyxDQUFDLElBQUksQ0FDL0IsR0FBRzs7O1FBQUMsR0FBRyxFQUFFLENBQUMsV0FBVyxDQUFDLEtBQUssRUFBRSxFQUFDLENBQy9COztjQUVLLGdCQUFnQixHQUFHLEVBQUUsQ0FBQyxFQUFFLENBQUMsQ0FBQyxJQUFJLENBQ2xDLEtBQUssQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEtBQUssQ0FBQyxFQUN6QixHQUFHOzs7UUFBQyxHQUFHLEVBQUUsQ0FBQyxXQUFXLENBQUMsUUFBUSxFQUFFLEVBQUMsQ0FDbEM7O2NBRUssWUFBWSxHQUFHLENBQUMsR0FBRyxJQUFJLENBQUMsT0FBTyxDQUFDLFdBQVcsRUFBRSxHQUFHLElBQUksQ0FBQyxPQUFPLENBQUMsY0FBYyxDQUFDO1FBRWxGLE1BQU0sQ0FBQyxNQUFNLENBQUMsSUFBSSxDQUNoQixNQUFNOzs7O1FBQUMsQ0FBQyxLQUFrQixFQUFFLEVBQUUsQ0FBQyxXQUFXLENBQUMsS0FBSyxFQUFFLFlBQVksQ0FBQyxFQUFDLEVBQ2hFLFNBQVM7Ozs7UUFBQyxDQUFDLEtBQWtCLEVBQUUsRUFBRSxDQUFDLFdBQVcsQ0FBQyxLQUFLLEVBQUUsSUFBSSxDQUFDLE9BQU8sQ0FBQyxXQUFXLENBQUMsQ0FBQyxDQUFDLENBQUMsYUFBYSxDQUFDLENBQUMsQ0FBQyxnQkFBZ0IsRUFBQyxDQUNuSCxDQUFDLFNBQVMsRUFBRSxDQUFDO0lBQ2hCLENBQUM7OztZQTlCRixVQUFVLFNBQUM7Z0JBQ1YsVUFBVSxFQUFFLE1BQU07YUFDbkI7Ozs7WUFoQlEsVUFBVTtZQUhWLE1BQU07NENBNEJzQyxRQUFRLFlBQUksTUFBTSxTQUFDLHlCQUF5Qjs7Ozs7Ozs7SUFQL0YsbUNBS0UiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgeyBJbmplY3RhYmxlLCBPcHRpb25hbCwgSW5qZWN0LCBUeXBlIH0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XHJcbmltcG9ydCB7IFJvdXRlciwgTmF2aWdhdGlvblN0YXJ0LCBOYXZpZ2F0aW9uRW5kLCBOYXZpZ2F0aW9uQ2FuY2VsLCBOYXZpZ2F0aW9uRXJyb3IsIFJvdXRlckV2ZW50IH0gZnJvbSAnQGFuZ3VsYXIvcm91dGVyJztcclxuaW1wb3J0IHsgb2YgfSBmcm9tICdyeGpzJztcclxuaW1wb3J0IHsgdGFwLCBkZWxheSwgc3dpdGNoTWFwLCBmaWx0ZXIgfSBmcm9tICdyeGpzL29wZXJhdG9ycyc7XHJcbmltcG9ydCB7IE5nUHJvZ3Jlc3MgfSBmcm9tICdAbmd4LXByb2dyZXNzYmFyL2NvcmUnO1xyXG5pbXBvcnQgeyBOZ1Byb2dyZXNzUm91dGVyQ29uZmlnLCBOR19QUk9HUkVTU19ST1VURVJfQ09ORklHIH0gZnJvbSAnLi9uZy1wcm9ncmVzcy1yb3V0ZXIuaW50ZXJmYWNlJztcclxuXHJcbi8qKlxyXG4gKiBDaGVjayBpZiBhIHJvdXRlciBldmVudCB0eXBlIGV4aXN0cyBpbiBhbiBhcnJheSBvZiByb3V0ZXIgZXZlbnQgdHlwZXNcclxuICogQHBhcmFtIHJvdXRlckV2ZW50XHJcbiAqIEBwYXJhbSBldmVudHNcclxuICovXHJcbmZ1bmN0aW9uIGV2ZW50RXhpc3RzKHJvdXRlckV2ZW50OiBSb3V0ZXJFdmVudCwgZXZlbnRzOiBUeXBlPFJvdXRlckV2ZW50PltdKSB7XHJcbiAgbGV0IHJlcyA9IGZhbHNlO1xyXG4gIGV2ZW50cy5tYXAoKGV2ZW50OiBUeXBlPFJvdXRlckV2ZW50PikgPT4gcmVzID0gcmVzIHx8IHJvdXRlckV2ZW50IGluc3RhbmNlb2YgZXZlbnQpO1xyXG4gIHJldHVybiByZXM7XHJcbn1cclxuXHJcbkBJbmplY3RhYmxlKHtcclxuICBwcm92aWRlZEluOiAncm9vdCdcclxufSlcclxuZXhwb3J0IGNsYXNzIE5nUHJvZ3Jlc3NSb3V0ZXIge1xyXG4gIHByaXZhdGUgcmVhZG9ubHkgX2NvbmZpZzogTmdQcm9ncmVzc1JvdXRlckNvbmZpZyA9IHtcclxuICAgIGlkOiAncm9vdCcsXHJcbiAgICBkZWxheTogMCxcclxuICAgIHN0YXJ0RXZlbnRzOiBbTmF2aWdhdGlvblN0YXJ0XSxcclxuICAgIGNvbXBsZXRlRXZlbnRzOiBbTmF2aWdhdGlvbkVuZCwgTmF2aWdhdGlvbkNhbmNlbCwgTmF2aWdhdGlvbkVycm9yXVxyXG4gIH07XHJcblxyXG4gIGNvbnN0cnVjdG9yKHByb2dyZXNzOiBOZ1Byb2dyZXNzLCByb3V0ZXI6IFJvdXRlciwgQE9wdGlvbmFsKCkgQEluamVjdChOR19QUk9HUkVTU19ST1VURVJfQ09ORklHKSBjb25maWc6IE5nUHJvZ3Jlc3NSb3V0ZXJDb25maWcpIHtcclxuICAgIHRoaXMuX2NvbmZpZyA9IGNvbmZpZyA/IHsuLi50aGlzLl9jb25maWcsIC4uLmNvbmZpZ30gOiB0aGlzLl9jb25maWc7XHJcbiAgICBjb25zdCBwcm9ncmVzc1JlZiA9IHByb2dyZXNzLnJlZih0aGlzLl9jb25maWcuaWQpO1xyXG5cclxuICAgIGNvbnN0IHN0YXJ0UHJvZ3Jlc3MgPSBvZih7fSkucGlwZShcclxuICAgICAgdGFwKCgpID0+IHByb2dyZXNzUmVmLnN0YXJ0KCkpXHJcbiAgICApO1xyXG5cclxuICAgIGNvbnN0IGNvbXBsZXRlUHJvZ3Jlc3MgPSBvZih7fSkucGlwZShcclxuICAgICAgZGVsYXkodGhpcy5fY29uZmlnLmRlbGF5KSxcclxuICAgICAgdGFwKCgpID0+IHByb2dyZXNzUmVmLmNvbXBsZXRlKCkpXHJcbiAgICApO1xyXG5cclxuICAgIGNvbnN0IGZpbHRlckV2ZW50cyA9IFsuLi50aGlzLl9jb25maWcuc3RhcnRFdmVudHMsIC4uLnRoaXMuX2NvbmZpZy5jb21wbGV0ZUV2ZW50c107XHJcblxyXG4gICAgcm91dGVyLmV2ZW50cy5waXBlKFxyXG4gICAgICBmaWx0ZXIoKGV2ZW50OiBSb3V0ZXJFdmVudCkgPT4gZXZlbnRFeGlzdHMoZXZlbnQsIGZpbHRlckV2ZW50cykpLFxyXG4gICAgICBzd2l0Y2hNYXAoKGV2ZW50OiBSb3V0ZXJFdmVudCkgPT4gZXZlbnRFeGlzdHMoZXZlbnQsIHRoaXMuX2NvbmZpZy5zdGFydEV2ZW50cykgPyBzdGFydFByb2dyZXNzIDogY29tcGxldGVQcm9ncmVzcylcclxuICAgICkuc3Vic2NyaWJlKCk7XHJcbiAgfVxyXG59XHJcbiJdfQ==