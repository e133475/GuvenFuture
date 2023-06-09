﻿using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.ProviderLocation;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.ProviderLocation
{
    public class ProviderLocationBusiness : BusinessCommonOperations<Entities.ProviderLocation.ProviderLocation>
    {
        #region For Custom Operations
        readonly ProviderLocationOperations _modelOp;
        public ProviderLocationBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new ProviderLocationOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
