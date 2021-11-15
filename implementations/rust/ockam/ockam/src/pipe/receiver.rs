use ockam_core::{Address, Any, Result, Routed, Worker};
use ockam_node::Context;

pub struct PipeReceiver {}

#[crate::worker]
impl Worker for PipeReceiver {
    type Context = Context;
    type Message = Any;

    async fn initialize(&mut self, ctx: &mut Context) -> Result<()> {
        ctx.set_cluster(super::CLUSTER_NAME).await?;
        Ok(())
    }

    async fn handle_message(&mut self, _: &mut Context, msg: Routed<Any>) -> Result<()> {
        info!("Pipe receiver: {:?}", msg);
        Ok(())
    }
}

impl PipeReceiver {
    pub async fn create(ctx: &mut Context, addr: Address) -> Result<()> {
        ctx.start_worker(addr, PipeReceiver {}).await
    }
}
