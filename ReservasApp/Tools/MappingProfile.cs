using AutoMapper;
using Entities.Models;
using Entities.ViewModels;

namespace WebShopApp.tools
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            _ = CreateMap<Reserva, ReservaViewModel>();
            _ = CreateMap<ReservaViewModel, Reserva>();



            //        CreateMap<Article, ArticleModel>()
            //.ForMember(dest => dest.BaseContentItem, opts => opts.MapFrom(src => src.BaseContentItem))
            //.ForPath(dest => dest.BaseContentItem.TopicTag, opts => opts.MapFrom(src => src.BaseContentItem.TopicTag))
            //.ForMember(dest => dest.MainImage, opts => opts.MapFrom(src => src.MainImage))
            //.ReverseMap();

            //_ = CreateMap<ReservaViewModel, Reserva>()
            //    .ForMember(d => d.ReservaId, o => o.MapFrom(s => s.ReservaId))
            //    .ForMember(d => d.HabitacionId, o => o.MapFrom(s => s.HabitacionId))
            //    .ForMember(d => d.FechaInicio, o => o.MapFrom(s => s.FechaInicio))
            //    .ForMember(d => d.FechaFin, o => o.MapFrom(s => s.FechaFin))
            //    .ForMember(d => d.ClienteId, o => o.MapFrom(s => s.ClienteId))
            //    //.ForMember(d => d.Cliente, o => o.MapFrom(s => s.Cliente))
            //    //.ForMember(d => d.Habitacion, o => o.MapFrom(s => s.Habitacion))

            //    ;
        }
    }
}
